class User < ActiveRecord::Base
  validates_presence_of :name
  has_many :pongs
  has_many :votes
  has_many :rates

  def to_s
    nickname || name || email
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.nickname = auth['info']['nickname'] || ""
         user.name = auth['info']['name'] || ""
         user.email = auth['info']['email'] || ""
      end
    end
  end

  def admin?
    nickname && nickname.in?(AppConfig.admins)
  end

  def reviewer?
    nickname && nickname.in?(AppConfig.reviewers)
  end

  def github_url
    "https://github.com/#{nickname}"
  end

end
