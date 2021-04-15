class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def create
    @book = Book.new
    @book = Book.new(book_params)
    if @book.user_id = current_user.id
       @book.save
       redirect_to book_path(@book.id),notice: 'successfully'
    else
       @books = Book.all
       @user = current_user
       render :'books#index'
    end 
  end

  def edit
    @user = User.find(params[:id])
    unless @user = current_user
      redirect_to user_path(current_user)
    end  
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to user_path(@user.id),notice: 'You have updated user successfully'
    else
      render :edit
    end  
  end

  private

  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
