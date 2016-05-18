module Mattermost
  class Post < MattermostObject

    def self.new(attributes = {})
      ::Post.new(attributes)
    end

    def self.search(terms)
      request = Mattermost.post("/teams/#{Mattermost.team.id}/posts/search", :body => { :terms => terms }.to_json)
      response = []
      request.parsed_response['posts'].each do |_, post|
      	response << self.new(post)
      end
      response 
    end

  end
end

