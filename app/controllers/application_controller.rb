class ApplicationController < ActionController::Base
  before_action :comfigure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:top, :about]

  def after_sign_in_path_for(resource)
    @user = 
    user_path(current_user.id)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def shared_path
    @post = Book.new
    @user = User.find(current_user.id)
  end

  def comfigure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name,:email])
  end

  def seve_clear
    if @post.save
      flash[:notice] = "You have created book successfully"
      redirect_to book_path(@post.id)
    else
      @user = User.find(current_user.id)
      @books = Book.all
      render :index
    end
  end

  def update_clear
    if @post.update(book_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to book_path(@post.id)
    else
      render :edit
    end
  end

  def matched_login_use
    user_id = params[:id].to_i
    login_user_id = current_user[:id].to_i
    if (user_id != login_user_id)
      redirect_to user_path(current_user.id)
    end
  end

end
