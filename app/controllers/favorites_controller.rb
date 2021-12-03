class FavoritesController < ApplicationController
  def create
    @favarite = crrent_user.favorites.create(nail_id: params[:nail_id])
    redirect_back{fallback_location: root_path}
  end

  def destory
    @nail = Nail.find(params[:nail_id])
    @favorite = current_user.favorites.find_by(nail_id: @recipe.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
