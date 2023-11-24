# CryptomateApi

Welcome to the `cryptomate_api` gem! This library is designed to interface with the [Cryptomate API](https://cryptomate.me/docs), providing a simple and efficient way to integrate cryptocurrency data into your Ruby applications.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cryptomate_api'
```

And then execute:

```bash
bundle install
```

Or install it yourself as:

```bash
gem install cryptomate_api
```

## Configuration

Before using the `cryptomate_api` gem, configure the global API key as follows:

```ruby
require 'cryptomate_api'

CryptomateApi.configure do |config|
  config.api_key = 'your_api_key_here'
end
```
## Usage

Here's a quick example of how to use `cryptomate_api`:

```ruby
client = CryptomateAPI::Management::Client.new
response = client.get_clients
```

## API Documentation

For detailed information about the API endpoints and responses, visit the [Cryptomate API documentation](https://cryptomate.me/docs).

## Contributing

Bug reports and pull requests are welcome. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for details about each release.

## Code of Conduct

Everyone interacting in the `cryptomate_api` project's codebases, issue trackers, chat rooms, and mailing lists is expected to follow the [code of conduct](CODE_OF_CONDUCT.md).
