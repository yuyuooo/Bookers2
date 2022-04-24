class BooksController < ApplicationController

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
    render ("books/index")
   end
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
        flash[:notice]
    end
    redirect_to book_path
  end

  def destroy
     @book = Book.find(params[:id])
     @book.destroy
     redirect_to books_path
  end

  private
  def book_params
   params.require(:book).permit(:title, :body)
  end
end
