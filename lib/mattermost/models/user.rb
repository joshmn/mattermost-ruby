class User < Base

  def reset_password(new_password)
    payload = {:name => Mattermost.team.name, :user_id => self.id, :new_password => new_password}
    Mattermost.post("/users/reset_password", :body => payload.to_json)
  end

  def status
    Mattermost::User.status([self.id])[self.id]
  end

  def preferences
    Mattermost.get("/preferences")
  end

end