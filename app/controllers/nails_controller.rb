class NailsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @nails = Nail.all.order('create_at DESC')
  end

  def new
    @nail = Nail.new
  end

  def create
    @nail = Nail.new(nail_params)
    if @nail.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def nail_params
    params.require(:nail).permit(:title, :detail, :thumb, :index_finger, :middle_finger, :ring_finger, :little_finger, :image).merge(user_id: current_user.id)    
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
