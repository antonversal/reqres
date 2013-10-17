require File.join(File.dirname(__FILE__), "test_suit_additions")

module Reqres
  module Generator
    def self.included(base)
      if Rake.application.top_level_tasks.grep(/^(reqres:yaml$)/).any?
        base.send(:include, TestSuitAdditions)
      end
    end
  end
end