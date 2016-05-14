class Post < Base
  attr_accessor :user

  def initialize(attributes)
    super(attributes)
    @user = Mattermost::User.find(attributes['user_id'])
  end

end