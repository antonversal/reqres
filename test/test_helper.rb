ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'minitest/pride'
require 'test/unit'
require 'rack/test'
require 'byebug'


class SkipRailsSuiteUnit < MiniTest::Unit
  def _run_suite(suite, type)
    if suite == RailsTestAppTesting
      [0, 0]
    else
      super(suite, type)
    end
  end
end

# skips output for rails test
class RailsSuiteUnit < MiniTest::Unit
  def puts *a
  end
  def print *a
  end
end

MiniTest::Unit.runner = SkipRailsSuiteUnit.new