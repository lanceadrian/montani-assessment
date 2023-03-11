class BooksController < ApplicationController
  def index
  end

  def show
    @book = Book.find_by(id: params[:id])
  end

  def convert
    @isbn ||= params[:isbn]
    @result ||= params[:result]
  end
  
  def convert_isbn
    if helpers.valid_isbn?(isbn)
      result = helpers.convert_isbn(isbn)
      if result
        respond_to do |format|
          format.html { redirect_to convert_url(isbn: isbn, result: result) }
          format.json { render :show, status: 302 }
        end
      else
        respond_to do |format|
          format.html { redirect_back_or_to :index, status: 404, notice: "Book does not exist"}
        end
      end
    else
      respond_to do |format|
        format.html { redirect_back_or_to :index, status: 400, notice: "ISBN was invalid"}
      end
    end
  end

  def search
    if helpers.valid_isbn?(isbn)
      book = find_book(isbn)
      if book
        respond_to do |format|
          format.html { redirect_to book_url(book)}
          format.json { render :show, status: 302 }
        end
      else
        respond_to do |format|
          format.html { redirect_back_or_to :index, status: 404, notice: "Book does not exist"}
        end
      end
    else
      respond_to do |format|
        format.html { redirect_back_or_to :index, status: 400, notice: "ISBN was invalid"}
      end
    end
  end

  private

  def find_book(isbn)
    return Book.find_by(isbn_10: formatted_isbn) if helpers.is_isbn_10?(isbn)
    return Book.find_by(isbn_13: formatted_isbn) if helpers.is_isbn_13?(isbn)
  end
 
  def isbn
    params[:isbn]
  end

  def formatted_isbn
    helpers.format_isbn(isbn)
  end
end
