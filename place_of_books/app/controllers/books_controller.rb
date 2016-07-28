class BooksController < ApplicationController

  def index
    @books = Book.all

    render :index
  end

  def show
    @book = Book.find(params["id"])
    # @book = Book.find_by(title: "Tale two Cities")

    render :show
  end

  def create
    @book = Book.create(book_params)

    redirect_to "/books/#{@book.id}"
  end

  def edit
    @book = Book.find(params["id"])
  end

  def update
    @book = Book.find(params["id"])

    @book.update(book_params)
    redirect_to "/books/#{@book.id}"
  end

  private def book_params
    # Hash style acccess for params
    # params["pet"] # {name: "Gridley"}

    # Strong params requiring a key to be present and allow
    params.require("book").permit(:title, :isbn, :description)
  end
end
