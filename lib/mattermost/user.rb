module Mattermost
  class User < MattermostObject

    def self.new(attributes = {})
      ::User.new(attributes)
    end

    def self.all(force_refresh = false)
      @users = nil if force_refresh
      @users ||= all_users
    end

    # Return a user that matches a given attribute.
    # Common pairs are :email => email, or :username => username
    # Return nil if not no matches
    def self.find_by(opts = {})
      all.select { |user| user.send(opts.keys.first) == opts.values.first }.first
    end

    # Return the user that has an id of @param id
    def self.find(id)
      find_by(:id => id)
    end

    # Return the status of users
    # Statuses are "offline", "away", or "online"
    def self.status(user_ids = [])
      Mattermost.post("/users/status", :body => user_ids.to_json)
    end

    # Returns the user that was used for authentication on Mattermost.connect
    def self.me
      request = Mattermost.get("/users/me")
      self.new(request.parsed_response)
    end

    def self.create_from_invite(email, password, username)
      Mattermost.post("/users/create?d=&iid=#{Mattermost.team.invite_id}", :body => {:allow_marketing => true, :email => email, :password => password, :username => username}.to_json)
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
