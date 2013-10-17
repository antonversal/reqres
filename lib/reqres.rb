require "active_support/core_ext/module/attribute_accessors"
require "reqres/version"
require "reqres/railtie" if defined?(Rails)

module Reqres
  # the name of the file for store generated data
  mattr_accessor :file_name
  @@file_name = "./reqres.yml"

  # rake files pattern to run for generating yml file
  mattr_accessor :test_files_pattern
  @@test_files_pattern = 'test/integration/**/*_testing.rb'

  # Way to setup Reqres. Add file to initializers:
  #   initializers/reqres.rb
  #
  #   Reqres.setup do |config|
  #     config.file_name = File.join(Rails.root, "doc", "reqres.yml")
  #     config.test_files_pattern = "test/acceptance/**/*_test.rb"
  #   end
  def self.setup
    yield self
  end
end