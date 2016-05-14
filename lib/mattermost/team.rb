module Mattermost
  class Team < MattermostObject

    def self.new(attributes = {})
      ::Team.new(attributes)
    end

    def self.all(force_refresh = false)
      @teams = nil if force_refresh
      @teams ||= all_teams
    end

    protected
    def self.all_teams
      teams = []
      request = Mattermost.get("/teams/all")
      request.parsed_response.values.each do |team|
        teams << self.new(team)
      end
      teams
    end

  end
end

