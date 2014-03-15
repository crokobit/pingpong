class PongDecorator < Draper::Decorator
  decorates :pong
  delegate_all

  def user_prc
    if !votes_count.zero?
      ((object.user_score.to_f / object.votes_count) * 100).round(2)
    else
      50
    end
  end

  def dhh_prc
    if !votes_count.zero?
      ((object.dhh_score.to_f / object.votes_count) * 100).round(2)
    else
      50
    end
  end

  def voted_for_dhh? user
    object.votes.from_user(user).dhh.present? if user.present?
  end

  def voted_for_user? user
    object.votes.from_user(user).user_votes.present? if user.present?
  end

  def voted_up? user
    object.rates.from_user(user).up.present? if user.present?
  end

  def voted_down? user
    object.rates.from_user(user).down.present? if user.present?
  end

end
