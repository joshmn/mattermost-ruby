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

## Supported versions of Mattermost

Tested against v3. In the future I'll publish separate versions for those who don't upgrade. But I'm going to assume most of us do since this is an infant.

## Setup

Because Mattermost doesn't provide an API user, Mattermost-Ruby uses a system admin account for its API calls. 
 
## Configuration

```
options = {:httparty => {:debug_output => $stdout} } # pass defaults to httparty
Mattermost.connect("apiuser", "apipassword", "https://mattermost.example.com/api/v3", "default_team_name", options)

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

