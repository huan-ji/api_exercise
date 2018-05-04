class BooksController < ApplicationController
  def index
    render json: [{ 1 => { name: 'lol_book' }}]
  end
end
