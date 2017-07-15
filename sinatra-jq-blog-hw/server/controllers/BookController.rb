class BookController < Sinatra::Base
  get '/' do
    books = Book.all
    books.to_json
  end

  get '/:id' do
    id = params[:id]
    book = Book.find(id)
    book.to_json
  end

  post '/' do
    request_body = JSON.parse(request.body.read)
    new_book = Book.new(request_body)
    new_book.save
    new_book.to_json
    "nice!"
  end

  patch '/:id' do
    id = params[:id]
    request_body = JSON.parse(request.body.read)
    book = Book.find(id)
    book.update_attributes(request_body)
    book.save
    book.to_json
  end

  delete '/:id' do
    id = params[:id]
    book = Book.find(id)
    book.destroy
    books = Book.all
    books.to_json
  end
end
