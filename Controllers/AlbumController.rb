class AlbumController < Sinatra::Base


	get '/' do
		 response['Access-Control-Allow-Origin'] = '*'
		 albums = Record.all
		 albums.to_json	
	end

	get '/:id' do
		response['Access-Control-Allow-Origin'] = '*'
		id = params[:id]
		content_type :json
		album = Record.find(id)
		track = album.track
		{album: album, track: track}.to_json

	end

	post '/' do

		response['Access-Control-Allow-Origin'] = '*'
		new_album = JSON.parse(request.body.read)
		album = Record.new(new_album)
		album.save
		album.to_json	

		"success"
	end

	patch '/:id' do
		response['Access-Control-Allow-Origin'] = '*'
		id = params[:id]
		album = Record.find(id)
		updated_album = JSON.parse(request.body.read)
		album.update_attributes(updated_album)
		album.save
		album.to_json
		
		"success"

	end

	delete '/:id' do
		response['Access-Control-Allow-Origin'] = '*'
		id = params[:id]
		album = Record.find(id)
		album.destroy
		albums = Record.all
		albums.to_json

		"success"
	end

end