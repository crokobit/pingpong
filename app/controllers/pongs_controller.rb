class PongsController < ApplicationController

  before_filter :authenticate_admin!, except: [:show]
  before_filter :check_pong, only: [:show]

  expose(:pong){ PongDecorator.decorate Pong.find(params[:id]) }
  expose(:user){ pong.user }

  def show
  end

  private

  def check_pong
    unless pong.accepted? or admin?
      raise ActiveRecord::RecordNotFound
    end
  end

end
