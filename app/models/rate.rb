class Rate < ActiveRecord::Base
  belongs_to :pong, counter_cache: true
  belongs_to :user

  scope :up, -> { where(up: true) }
  scope :down, -> { where(up: false) }
  scope :from_user, -> (user){ where(user_id: user.id) }

  after_save :count_rating

  private

  def count_rating
    pong.rating = 2 * pong.rates.up.count - pong.rates.count
    pong.save
  end

end
