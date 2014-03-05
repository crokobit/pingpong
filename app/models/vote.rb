class Vote < ActiveRecord::Base
  belongs_to :pong, counter_cache: true
  belongs_to :user

  scope :dhh, -> { where(dhh: true) }
  scope :user_votes, -> { where(dhh: false) }

  after_save :count_votes

  private

  def count_votes
    pong.dhh_score = pong.votes.dhh.count
    pong.user_score = pong.votes.user_votes.count
    pong.save
  end

end
