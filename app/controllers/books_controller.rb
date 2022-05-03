class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  def index
    @book = Book.new
    @books = Book.all
    @user = User.find_by(id: current_user.id)
  end

  def create
    @book = Book.new(book_params)
    @books = Book.all
    @book.user_id = current_user.id
   if @book.save
     flash[:notice]="You have created book successfully."
    redirect_to book_path(@book.id)
   else
    @user = current_user
    render :index
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
       redirect_to book_path
    else
      render :edit
    end
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
  
  def correct_user
   @book = Book.find(params[:id])
   @user = @book.user 
   redirect_to(books_path) unless @user == current_user
  end
    
end
