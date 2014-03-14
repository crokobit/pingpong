class PongsController < ApplicationController

  before_filter :authenticate_admin!, except: [:new, :create, :index, :show]
  before_filter :authenticate_user!, only: [:new, :create]
  before_filter :check_pong, only: [:show]

  expose(:pong){ PongDecorator.decorate Pong.find(params[:id]) }
  expose(:user){ pong.user }
  expose(:new_pong){ current_user.pongs.new }
  expose(:accepted_pongs){ Pong.accepted }
  expose(:pending_pongs){ Pong.pending if admin? or reviewer? }
  expose(:my_pongs){ Pong.from_user(current_user) if user_signed_in? }

  def show
  end

  def new
  end

  def edit
  end

  def update
    pong.attributes = pong_params
    if pong.save
      redirect_to pong, flash: { notice: "Updated!" }
    else
      render :edit
    end
  end

  def toggle
    pong.accepted = !pong.accepted
    pong.save
    redirect_to pong
  end

  def destroy
    pong.destroy
    redirect_to root_url, flash: { notice: "This ping-pong is no more."}
  end

  def create
    new_pong.attributes = user_pong_params
    if new_pong.save
      redirect_to new_pong, flash: { notice: "Pong submited!" }
    else
      render :new
    end
  end

  private

  def check_pong
    unless pong.accepted? or pong_user_access?(pong)
      raise ActiveRecord::RecordNotFound
    end
  end

  def pong_user_access?(pong)
    admin? or reviewer? or (user_signed_in? and pong.user == current_user)
  end

  def user_pong_params
    params.fetch(:pong, {}).permit(:gist, :description)
  end

  def pong_params
    params.fetch(:pong, {}).permit(:gist, :description, :dhh_gist, :answer)
  end

end
