class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @nails = @user.nails
  end
end
