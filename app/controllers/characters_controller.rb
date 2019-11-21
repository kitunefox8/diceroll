class CharactersController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    # binding.pry
    @characters = Character.where(params[:id]).order("created_at DESC")
    
  end

  def show
    @characters = Character.find(params[:id])
  end

  def new
    @characters = Character.new
    # @characters.character_users.build
    # @character.users << current_user
    @characters.build_status
  end

  def create
    @characters = Character.new(character_params)
    # binding.pry
    if @characters.save
      # respond_to do |format|
      #   format.html { redirect_to characters_path  }
      #   format.json 
      # end
      redirect_to characters_path
    else
      render :new
    end
  end

  def edit
    @characters = Character.find(params[:id])
  end

  def update
    @characters = Character.find(params[:id])
    if @characters.update(update_character_params)
      redirect_to characters_path
    else
      render :edit
    end
  end

  def destroy
    @characters = Character.find(params[:id])
    if @characters.destroy 
      redirect_to root_path
    end
  end


  private
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def character_params
    params.require(:character).permit(:name, :gold, {user_ids:[]},
      status_attributes: [:id, :life]
    )
  end

  def update_character_params
    params.require(:character).permit(:name, :gold, :id, {user_ids:[]},
      status_attributes: [:id, :_destroy, :life]
    )
  end
end
