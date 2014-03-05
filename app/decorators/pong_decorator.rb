class PongDecorator < Draper::Decorator
  decorates :pong
  delegate_all

  def user_prc
    if !votes_count.zero?
      (object.user_score.to_f / object.votes_count) * 100
    else
      50
    end
  end

  def dhh_prc
    if !votes_count.zero?
      (object.dhh_score.to_f / object.votes_count) * 100
    else
      50
    end
  end

end
