class BooksController < ApplicationController
  before_action :correct_user, only:[:edit]

  def index
  	@books = Book.all
    @book = Book.new
    @user = User.find(current_user.id)
  end

  def show
  	@book = Book.find(params[:id])
    @user = @book.user
  end

  def create
  	@book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = @book.user
  	if @book.save
  		flash[:notice] = 'Book was successfully created.'
  		redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
  	@book = Book.find(params[:id])
    if @book.update(book_params)
       flash[:notice] = 'Book was successfully updated.'
       redirect_to book_path(@book.id)
    else
      render '/books/edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
       flash[:notice] = 'Book was successfully destroyed.'
       redirect_to user_path(current_user.id)
    end
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end

  def correct_user
    @book = Book.find(params[:id])
    if @book.user != current_user
       redirect_to books_path
    end
   end
end
