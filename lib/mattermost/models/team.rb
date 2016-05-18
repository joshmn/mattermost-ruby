class Team < Base

  def add_user(user)
    Mattermost.post("/teams/#{Mattermost.team.id}/add_user_to_team", :body => { :user_id => user.id }.to_json )
  end

end