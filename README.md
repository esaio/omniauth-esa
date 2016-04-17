# omniauth-esa

The official OmniAuth strategy for [esa API v1](https://docs.esa.io/posts/102)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-esa'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-esa

## Usage

```ruby
# Sinatra
require 'omniauth-esa'
use OmniAuth::Builder do
  provider :esa, ENV['ESA_CLIENT_ID'], ENV['ESA_CLIENT_SECRET'], scope: 'read write'
end

# Rails
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :esa, ENV['ESA_CLIENT_ID'], ENV['ESA_CLIENT_SECRET'], scope: 'read write'
end
```

## Auth Hash

Here's an example *Auth Hash* available in `request.env['omniauth.auth']`:

```ruby
{
  "provider": "esa",
  "uid": 1,
  "info": {
    "nickname": "fukayatsu",
    "name": "Atsuo Fukaya",
    "email": "fukayatsu@esa.io",
    "image": "https://img.esa.io/uploads/production/users/1/icon/thumb_m_402685a258cf2a33c1d6c13a89adec92.png"
  },
  "credentials": {
    "token": "1a2b3c....",
    "expires": false
  },
  "extra": {
    "raw_info": {
      "id": 1,
      "name": "Atsuo Fukaya",
      "screen_name": "fukayatsu",
      "created_at": "2014-05-10T11:50:07+09:00",
      "updated_at": "2016-04-17T15:36:43+09:00",
      "icon": "https://img.esa.io/uploads/production/users/1/icon/thumb_m_402685a258cf2a33c1d6c13a89adec92.png",
      "email": "fukayatsu@esa.io"
    }
  }
}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/esaio/omniauth-esa. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
