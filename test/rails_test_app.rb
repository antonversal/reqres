require "rails"
require "action_controller/railtie"
require "rails/test_unit/railtie"
require File.expand_path '../../lib/reqres.rb', __FILE__

class RailsTestApp < Rails::Application
  config.root = File.dirname(__FILE__)
  config.logger = Logger.new(File.expand_path('../test.log', __FILE__))
  config.secret_token = '675d4035f0f6aaf2caa010a2a206d84c'
  Rails.logger = config.logger
  routes.draw do
    resources :foos, only: :index
  end
end

#
# Stubs rake task name
# Additional script included only if it was run by reqres:yaml task
module Rake
  class Application
    def top_level_tasks
      ["reqres:yaml"]
    end
  end
end

class FoosController < ActionController::Base
  def index
    render json: {name: "foo", description: "bar"}
  end
end