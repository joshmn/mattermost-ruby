# Mattermost-Ruby

An ActiveRecord-inspired API client for Mattermost

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mattermost-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mattermost-ruby

## Configuration

```
options = {:httparty => {:debug_output => $stdout} } # pass defaults to httparty
Mattermost.connect("apiuser", "apipassword", "https://mattermost.example.com/api/v1", "default_team_name", options)

users = Mattermost::User.all
users.last.class #User

users.last.reset_password("newpassword")
users.last.id # abcdefgh12345678

Mattermost::User.find("abcdefgh12345678") 
Mattermost::User.find_by(:email => "me@example.com") # <#User ...> 
```

## Todo

Documentation.

Tests.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/joshmn/mattermost-ruby.

