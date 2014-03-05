class Pong < ActiveRecord::Base

  has_many :votes
  belongs_to :user

  validates :gist, :description, presence: true
  default_scope -> { order(created_at: :desc) }
  scope :accepted, -> { where(accepted: true) }
  scope :pending, -> { where(accepted: false) }
end
