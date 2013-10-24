require 'active_support/concern'
require 'yaml'

module Reqres
  module TestSuitAdditions
    extend ActiveSupport::Concern
    @@all_tests = {}

    module ClassMethods

      # saves yml file to the path
      def save_to_file
        File.open(Reqres.file_name, "w") do |file|
          file.write all_tests.to_yaml
        end
      end
    end

    # returns hash for each test
    def data_of_test
      {__name__ =>
         {
           "request" => {
             "url" => request.url,
             "full_path" => request.fullpath,
             "params" => request.params.to_hash,
             "method" => request.method,
             "body" => request.body.read,
             "headers" => request_headers
           },
           "response" => {
             "code" => response.code,
             "body" => response.body,
             "headers" => response.headers
           }
         }
      }
    end

    # request.headers is ActionDispatch::Http::Headers.
    # It can't be serialized right to yaml
    def request_headers
      hdrs = Reqres.request_headers
      request.headers.inject({}) do |memo,(k,v)|
        if hdrs.include? k
          memo.merge(k => v)
        else
          memo
        end
      end
    end

    # collects data from all tests
    def collect
      if all_tests[self.class.name].nil?
        all_tests[self.class.name] = data_of_test
      else
        all_tests[self.class.name].merge!(data_of_test)
      end
    end

    included do
      cattr_reader :all_tests
      teardown do
        collect
      end

      MiniTest::Unit.after_tests do
        save_to_file
      end
    end
  end
end