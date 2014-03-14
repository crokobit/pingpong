class RatesController < ApplicationController
  expose(:pong){ Pong.find params[:pong_id] }
  expose(:rate){ current_user.rates.find_or_initialize_by(pong_id: pong.id) }

  before_filter :authenticate_reviewer!

  def up
    rate.up = true
    rate.save
    redirect_to pong
  end

  def down
    rate.up = false
    rate.save
    redirect_to pong
  end

end
