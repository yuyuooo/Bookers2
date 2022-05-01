class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @book = Book.new
    @books = Book.all
    @user = User.find_by(id: current_user.id)
  end

  def create
    @user = User.find_by(id: current_user.id)
    @book = Book.new(book_params)
    @books = Book.all
    @book.user_id = current_user.id
   if @book.save
     flash[:notice]="You have created book successfully."
    redirect_to book_path(@book.id)
   else
    render ("index")
   end
  end

  def show
    @new_book = Book.new
    @book = Book.find(params[:id])
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
        flash[:notice]="You have updated book successfully."
    end
    redirect_to book_path
  end

  def destroy
     @book = Book.find(params[:id])
     @book.destroy
     flash[:notice]="Book was successfully destroyed."
     redirect_to books_path
  end

  private
  def book_params
   params.require(:book).permit(:title, :body)
  end
end
