require 'rake/testtask'
require 'rails/test_unit/sub_test_task'

namespace :reqres do
  desc "Generating YAML file from integration tests"
  task :yaml => "test:prepare" do
    # This hack allows to use settings form Reqres module
    Rails::TestTask.new("reqres:yaml2") do |t|
      t.pattern = Reqres.test_files_pattern
    end
    Rake::Task['reqres:yaml2'].invoke
  end

end
