class Post < Base
  attr_accessor :user

  def initialize(attributes)
    super(attributes)
    if attributes['user_id']
	  @user = Mattermost::User.find(attributes['user_id'])
	end
  end

end