#require "mattermost/version"

require 'httparty'
require 'pry'

require_relative 'mattermost/mattermost_object'
require_relative 'mattermost/models/base'
require_relative 'mattermost/team'
require_relative 'mattermost/user'
require_relative 'mattermost/admin'
require_relative 'mattermost/channel'

module Mattermost

  include HTTParty

  attr_accessor :team

  class NotImplementedError < StandardError; end

  def self.connect(username, password, server, team_name, options = {})
    self.base_uri server
    request = self.post('/users/login',
                            :body => { :name => team_name, :username => username, :password => password}.to_json )
    self.headers "Cookie" => "MMTOKEN=#{request.headers['token']}"
    self.headers "X-Requested-With" => 'XMLHttpRequest'
    @team = Team.new({:id => request.parsed_response['team_id'], :name => team_name})
    options[:httparty].each do |k,v|
      self.send(k, v)
    end
    unless options[:preload_user] == false
      Mattermost::User.all
    end
  end

  def self.team
    @team
  end

end
