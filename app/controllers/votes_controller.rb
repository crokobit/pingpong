class VotesController < ApplicationController
  expose(:pong){ Pong.find params[:pong_id] }
  expose(:vote){ current_user.votes.find_or_initialize_by(pong_id: pong.id) }

  before_filter :authenticate_user!

  def dhh
    vote.dhh = true
    vote.save
    redirect_to pong
  end


  def user
    vote.dhh = false
    vote.save
    redirect_to pong
  end
end
