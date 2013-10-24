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
    
Include `Reqres::Generator` module to `ActiveSupport::TestCase` in `test_helper.rb`:

```ruby
require 'reqres/generator'

class ActiveSupport::TestCase
  include Reqres::Generator
  ...
```

## Usage

For generating file run:

    rake reqres:yaml

By default for generating is used integration test but you can set a pattern
in initializers:

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

You can change default request header extraction, which is
`%w{HTTP_AUTHORIZATION HTTP_ACCEPT CONTENT_TYPE}`:

```ruby
config.request_headers = %w{HTTP_AUTHORIZATION CONTENT_TYPE}
```

Generated file will have structure:
```yaml
ManageFooTest:
  test_creates_foo:
    request:
      url: http://www.example.com/v1/foos
      full_path: /v1/foos
      params:
        name: Bar
        description: FooBar
        action: create
        controller: v1/foos
      method: POST
      body: '{"name":"Bar","description":"FooBar"}'
      headers:
        http_authorization: Token token="14d75ec70594d026de22f02502e74be9"
        content_type: application/json
        accept: application/json
    response:
      code: '201'
      body: '{"id":974435878,"name":"Bar","description":"FooBar"}'
  test_getting_foo:
    request:
    ....
```
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
