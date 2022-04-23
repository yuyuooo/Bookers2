class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
#わからない点！
  end
#わからない点！
  def create
    @book = Book.new(book_params)
    @books = Book.all
    @book.user_id = current_user.id
   if @book.save(book_params)
     flash[:notice]="You have created book successfully."
    redirect_to book_path(@book.id)
   else
    render ("books/index")
   end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]="You have updated user successfully."
    end
    redirect_to user_path(id: current_user.id)
  end

  def index
  @users = User.all
  @user = User.find_by(id: current_user.id)
  end

  private
  def user_params
   params.require(:user).permit(:name, :profile_image, :body)
  end

  def book_params
   params.require(:book).permit(:title, :body)
  end
end

