module Mattermost
  class User < MattermostObject

    def self.new(attributes = {})
      ::User.new(attributes)
    end

    def self.all(force_refresh = false)
      @users = nil if force_refresh
      @users ||= all_users
    end

    # Return the status of users
    # Statuses are "offline", "away", or "online"
    def self.status(user_ids = [])
      request = Mattermost.post("/users/status", :body => user_ids.to_json)
    end

    # Returns the user that was used for authentication on Mattermost.connect
    def self.me
      request = Mattermost.get("/users/me")
      self.new(request.parsed_response)
    end

    # Create a user from the team's invite.
    # Returns a user
    def self.create_from_invite(email, password, username)
      request = Mattermost.post("/users/create?d=&iid=#{Mattermost.team.invite_id}", 
        :body => {:allow_marketing => true, :email => email, :password => password, :username => username}.to_json)
      self.new(request.parsed_response)
    end

    protected
    def self.all_users
      users = []
      request = Mattermost.get("/users/profiles/#{Mattermost.team.id}")
      request.parsed_response.values.each do |user|
        users << self.new(user)
      end
      users
    end
  end
end
