class BooksController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @newbook = Book.new
    @books = Book.all
    @book = Book.find(params[:id])

  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
       redirect_to books_path
    end
  end

  def update
    @user = current_user
    @books = Book.all
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    if @book.update(book_params)
       flash[:notice] = "You have updated book successfully."
       redirect_to book_path(@book.id)
    else
       render :index
    end
  end

  def create
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @books = Book.all
    if @book.save
      flash[:notice] = "You have creatad book successfully."
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
