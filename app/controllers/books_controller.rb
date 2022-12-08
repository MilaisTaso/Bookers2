class BooksController < ApplicationController
  def index
    @books = Book.all
    shared_path
  end

  def create
    @post = Book.new(book_params)
    @post.user_id = current_user.id
    seve_clear
  end

  def show
    shared_path
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
  end

  def edit
    matched_login_use
    @post = Book.find(params[:id])
  end

  def update
    matched_login_use
    @post = Book.find(params[:id])
    update_clear
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def matched_login_use
    user_id = Book.find(params[:id]).user_id.to_i
    login_user_id = current_user.id.to_i
    if (user_id != login_user_id)
      redirect_to user_path(current_user.id)
    end
  end

end
