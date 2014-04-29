class RatesController < ApplicationController
  expose(:pong){ Pong.find params[:pong_id] }
  expose(:rate){ current_user.rates.find_or_initialize_by(pong_id: pong.id) }

  before_filter :authenticate_reviewer!

end
