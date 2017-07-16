class AlbumController < Sinatra::Base


	get '/albums' do
		 
		 albums = Record.all
		 albums.to_json	
	end

	get '/albums/:id' do
		id = params[:id]
		album = Record.find(id)
		album.to_json	
	end

	post '/albums' do

		new_album = JSON.parse(request.body.read)
		album = Record.new(new_album)
		album.save
		album.to_json	

		"success"
	end

	patch '/albums/:id' do
		id = params[:id]
		album = Record.find(id)
		updated_album = JSON.parse(request.body.read)
		album.update_attributes(updated_album)
		album.save
		album.to_json
		
		"success"

	end

	delete '/albums/:id' do

		id = params[:id]
		album = Record.find(id)
		album.destroy
		albums = Record.all
		albums.to_json

		"success"
	end

end