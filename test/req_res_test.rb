require File.expand_path '../test_helper.rb', __FILE__
require File.expand_path '../rails_test_app_testing.rb', __FILE__

class ReqResTest < MiniTest::Unit::TestCase
  def test_something
    RailsSuiteUnit.new._run_suite(RailsTestAppTesting, :test)
    assert_equal(1,1)
  end
end
