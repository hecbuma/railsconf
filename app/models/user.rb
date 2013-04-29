class User < ActiveRecord::Base

  attr_accessible :name, :provider, :uid, :email, :avatar

  has_many :sessions

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"]
      user.avatar = auth['extra']['raw_info']["avatar_url"]
    end
  end

  def check_id(id)
    sessions.where(custom_id: id).count > 1
  end
end
