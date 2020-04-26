class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
    @book = Book.new
    @books = Book.all
  end

  def index
  	@user = User.all
  end

  def edit
    if user.id == current_user.id
  	   @user = User.find(params[:id])
    else

    end
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	redirect_to user_path(@user.id)
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image_id)
  end
end
