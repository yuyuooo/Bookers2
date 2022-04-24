class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
#わからない点！上の１行
  end
#わからない点！new bookをuserページに置き、作成できる機能


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
  #わからない点！なぜかうまくupdateできずにそのままの状態になる

  def index
  @users = User.all
  @user = User.find_by(id: current_user.id)
  end

  private
  def user_params
   params.require(:user).permit(:name, :profile_image, :body)
  end
end

