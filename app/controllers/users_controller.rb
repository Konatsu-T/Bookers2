class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def index
  	@user = current_user
    @users = User.all
    @book = Book.new
  end

  def create
    @user = current_user
    @book = Book.new
    @books = Book.all
    if @book.save
      flash[:notice] = "You have creatad book successfully."
      redirect_to book_path(current_user)
    else
      render :index
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
       redirect_to user_path(current_user)
    end
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
