class Pong < ActiveRecord::Base

  has_many :votes
  has_many :rates
  belongs_to :user

  validates :gist, :description, presence: true
  default_scope -> { order(created_at: :desc) }
  scope :accepted, -> { where(accepted: true) }
  scope :pending, -> { where(accepted: false) }
  scope :from_user, -> (user){ where(user_id: user.id) }

end
