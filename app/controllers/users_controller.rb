class UsersController < ApplicationController
  def show
    shared_path
    @user = User.find(params[:id])
    @books = @user.books
  end

  def index
    @users = User.all
    shared_path
  end

  def edit
    matched_login_use
    @post = User.find(current_user.id)
  end

  def update
    matched_login_use
    @post = User.find(params[:id])
    update_clear
  end

  private
    def user_params
      params.require(:user).permit(:name, :introduction, :user_image)
    end

    def update_clear
      if @post.update(user_params)
        flash[:notice] = "You have updated user successfully."
        redirect_to user_path(@post.id)
      else
        render :edit
      end
    end

end
