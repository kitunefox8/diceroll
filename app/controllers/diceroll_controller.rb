class DicerollController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @user_num = num=rand(6)+1
    @enemy_num = num=rand(6)+1
  end

  def show
    @user_num = num=rand(6)+1
    @enemy_num = num=rand(6)+1
  end

  private
  # def tweet_params
  #   params.permit(:image, :text)
  # end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
