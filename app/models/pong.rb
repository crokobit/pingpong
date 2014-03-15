class Pong < ActiveRecord::Base

  has_many :votes
  has_many :rates
  belongs_to :user

  validates :gist, :description, presence: true
  validate :gist_url_host
  scope :accepted, -> { where(accepted: true).order(rating: :desc) }
  scope :pending, -> { where(accepted: false).order(rating: :desc) }
  scope :from_user, -> (user){ where(user_id: user.id).order(created_at: :desc) }

  after_save :remove_last_slash

  def remove_last_slash
    if self.gist.last == "/"
      self.update_attributes(gist: self.gist[0..-2])
    end
  end

  def gist_url_host
    gist_uri = URI.parse(gist)
    errors.add(:gist, 'Sorry, we only accept gists from github!') unless gist_uri.host == 'gist.github.com'
  rescue
    errors.add(:gist, 'Sorry, we accept the code only as gists from github (i.e. https://gist.github.com/madsheep/3c5378c4d03ff7b3e0e7)')
  end



end
