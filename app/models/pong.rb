class Pong < ActiveRecord::Base

  has_many :votes
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  scope :accepted, -> { where(accepted: true) }
end
