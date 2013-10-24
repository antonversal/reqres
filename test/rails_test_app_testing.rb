ENV['RACK_ENV'] = 'test'
require File.expand_path '../rails_test_app.rb', __FILE__

require File.expand_path '../../lib/reqres/generator', __FILE__
class RailsTestAppTesting < ActionDispatch::IntegrationTest
  include Reqres::Generator

  def app
    Rails.application
  end

  test "gets all foos" do
    get "/foos", {page: 1}, {"CONTENT_TYPE" => "application/json",
                             "ACCEPT" => "application/json",
                             'HTTP_AUTHORIZATION' =>
                               'Token token="14d75ec70594d026de22f02502e74be9"'}
    puts response.body
    assert_response :success
  end

  test "gets other all foos" do
    get "/foos", {page: 1}, {"CONTENT_TYPE" => "application/json",
                             "ACCEPT" => "application/json",
                             'HTTP_AUTHORIZATION' =>
                               'Token token="14d75ec70594d026de22f02502e74be9"'}
    puts response.body
    assert_response :success
  end

end