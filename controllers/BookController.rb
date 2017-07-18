class BookController < Sinatra::Base
  get '/' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    Book.all.to_json
  end

  get '/:id' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    id = params[:id]
    book = Book.find(id)
    library = book.libraries
    {book: book, library: library}.to_json
  end

  post '/' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    book_props = JSON.parse(request.body.read)
    book = Book.new(book_props)
    book.save
    book.to_json
  end

  patch '/:id' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    id = params[:id]
    book = Book.find(id)
    book_props = JSON.parse(request.body.read)
    book.update_attributes(book_props)
    book.save
    book.to_json
  end

  delete '/:id' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    id = params[:id]
    book = Book.find(id)
    book.destroy
    Book.all.to_json
  end
end
