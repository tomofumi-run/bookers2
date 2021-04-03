class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def index
    @books = Book.all
    @user = User.find(params[:id])
  end


  def show
    @book = Book.find(params[:id])
    @user = User.where(id: @user.id)
  end
  
  def edit
    @book = Book.find(params[:id])
  end

  def destroy
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title,:body)
  end
end
