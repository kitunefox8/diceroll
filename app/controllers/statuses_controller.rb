class StatusesController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
  end

  def show
  end

  def new
    @statuses = Status.new
  end

  def create
    @statuses = Status.new(status_params)
    if @statuses.save
      redirect_to new_status_path
    else
      render :index
    end
  end

  private
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def status_params
    params.require(:status).permit(:content, :image)
  end
end

