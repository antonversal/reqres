if defined?(Rake.application) && Rake.application.top_level_tasks.grep(/^(reqres(:|$))/).any?
  ENV['RAILS_ENV'] ||= 'test'
  Rails.env = ENV['RAILS_ENV'] # don't know why but set ENV['RAILS_ENV'] is not enough
end

module Rails
  class ReqresRailtie < Rails::Railtie
    rake_tasks do
      load "tasks/reqres.rake"
    end
  end
end
