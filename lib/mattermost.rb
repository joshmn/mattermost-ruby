require_relative 'mattermost/version'

require 'httparty'
require 'pry'

require_relative 'mattermost/mattermost_object'
require_relative 'mattermost/models/base'
require_relative 'mattermost/team'
require_relative 'mattermost/post'
require_relative 'mattermost/user'
require_relative 'mattermost/admin'
require_relative 'mattermost/channel'

module Mattermost

  include HTTParty

  attr_accessor :team

  class NotImplementedError < StandardError; end

  def self.connect(username, password, server, team_name, options = {})
    self.base_uri server
    options[:httparty].each do |k,v|
      self.send(k, v)
    end
    request = self.post('/users/login',
                            :body => { :login_id => username, :password => password, :token => "" }.to_json )
    self.headers "Cookie" => "MMAUTHTOKEN=#{request.headers['token']}"
    self.headers "X-Requested-With" => 'XMLHttpRequest'
    initial_load = self.get("/users/initial_load")
    team = initial_load.parsed_response['teams'].select { |team| team['name'] == team_name }.first
    @team = Team.new(team)
    unless options[:preload_user] == false
      Mattermost::User.all
    end
  end

  def self.connected?
    Mattermost.get("/users/me").success?
  end

  def self.team
    @team
  end

end
