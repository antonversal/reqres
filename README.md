# Reqres

Simple application for generating Request and Response YAML file from test.
Can be used for creating fake API with sinatra.
And for generating API documentation.

__Only works on Rails and MiniTest::Unit for now__

## Installation

Add this line to your application's Gemfile:

    gem 'reqres'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install reqres

## Usage

For generating file run:

    rake reqres:yaml

By default for generating is used integration test but you can set a pattern in initializers:

```ruby
# initializers/reqres.rb
Reqres.setup do |config|
  config.test_files_pattern = "test/acceptance/**/*_test.rb"
end    
```

Generated file saves to current dir, you can set this in settings: 

```ruby
config.file_name = File.join(Rails.root, "doc", "reqres.yml")
```
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
