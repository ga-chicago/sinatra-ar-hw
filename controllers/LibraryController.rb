class LibraryController < Sinatra::Base
  get '/' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    libraries = Library.all
    libraries.to_json
  end

  get '/:id' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    id = params[:id]
    library = Library.find(id)
    books = library.books
    {library: library, books: books}.to_json
  end

  post '/' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    request_body = JSON.parse(request.body.read)
    library = Library.new(request_body)
    library.save
    library.to_json
  end

  patch '/:id' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    id = params[:id]
    library = Library.find(id)
    request_body = JSON.parse(request.body.read)
    library.update_attributes(request_body)
    library.save
    library.to_json
  end

  delete '/:id' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    id = params[:id]
    library = Library.find(id)
    library.destroy
    libraries = Library.all
    libraries.to_json
  end
end
