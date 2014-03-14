class Rate < ActiveRecord::Base
  belongs_to :pong, counter_cache: true
  belongs_to :user

  scope :up, -> { where(up: true) }
  scope :from_user, -> (user){ where(user_id: user.id) }

end
