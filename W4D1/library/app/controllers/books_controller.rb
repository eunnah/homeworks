class BooksController < ApplicationController
  def index
    # your code here
    @books = Book.all
  end

  def new
    # your code here
    render :new
  end

  def create
    # your code here
    book = Book.new(book_params)

    if book.save
      redirect_to books_url
    else
      render json: book.errors.full_messages, status: :unprocessable_entity
    end

  end

  def destroy
    # your code here
    # fail
    book = Book.find_by(id: params[:id])

      if book.destroy
        redirect_to books_url
      end
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
