class BooksController < ApplicationController
  def index
  	@books = Book.all
    @book = Book.new
    @user = User.find(current_user.id)
  end

  def show
  	@book = Book.find(params[:id])
  end

  def create
  	@book = Book.new(book_params)
    @book.user_id = current_user.id
  	if @book.save
  		flash[:notice] = 'Book was successfully created.'
  		redirect_to book_path(@book.id)
  	else
  		render '/users/show'
    end
  end

  def edit
  	@book = Bood.find(params[:id])
  end

  def update
  	
  end

  def destroy
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
