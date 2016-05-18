module Mattermost
  class Post < MattermostObject

    def self.new(attributes = {})
      ::Post.new(attributes)
    end

    def self.search(term)
      Mattermost.post("/teams/#{Mattermost.team.id}/posts/search", :body => { :term => term })
    end

  end
end

