class BooksController < ApplicationController
  include BooksHelper

  before_filter :signed_in_user, only: [:create, :new, :edit, :update]
  before_filter :check_book_owner, only: [:destroy, :update, :edit]

  def index
    @books = Book.all
  end
  def new
    @book = Book.new
  end
  def create
    new_book = params.require(:book).permit(:title, :cuisine, :chef, :image,:recipes)
    new_book[:user_id]= current_user.id
    @book = Book.create(new_book)
    render :show
  end
  def show
    @book = Book.find(params[:id])
  end
  def edit
    @book = Book.find(params[:id])
  end
  def update
    @book = current_user.books.where(:id => params[:id])
    @book.update_attributes(params[:book])
    render :show
  end
  def destroy
    book = current_user.books.where(:id => params[:id])
    
    book.delete
    redirect_to(books_path)
  end

end
