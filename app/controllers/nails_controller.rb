class NailsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :search ]
  before_action :set_nail, only: [:show, :edit, :update, :destroy]

  def index
    @nails = Nail.all
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

  def show
    @comment = Comment.new
    @comments = @nail.comments.includes(:user)
  end

  def edit
  end

  def update
    if @nail.update(nail_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @nail.destroy
    redirect_to root_path
  end

  def search
    @nails = Nail.search(params[:keyword])
  end

  private

  def nail_params
    params.require(:nail).permit(:title, :detail, :item, :thumb, :index_finger, :middle_finger, :ring_finger, :little_finger, :image).merge(user_id: current_user.id)    
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def set_nail
    @nail = Nail.find(params[:id])
  end
end
