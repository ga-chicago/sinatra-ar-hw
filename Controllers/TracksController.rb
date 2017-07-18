class TracksController < Sinatra::Base

get '/'  do
	
	response['Access-Control-Allow-Origin'] = '*'
	tracks = Track.all
	tracks.to_json
	
end

get '/:id' do
	
	response['Access-Control-Allow-Origin'] = '*'
	id = params[:id]
	content_type :json
	track = Track.find(id)
	albums = track.record
	{track: track, record: albums}.to_json
	
end

post '/' do

	response['Access-Control-Allow-Origin'] = '*'
	new_track = JSON.parse(request.body.read)
	track = Track.new(new_track)
	track.save
	track.to_json

	"success"
end

patch '/:id' do

	response['Access-Control-Allow-Origin'] = '*'
	id = params[:id]
	track = Track.find(id)
	updated_track = JSON.parse(request.body.read)
	track.update_attributes(updated_track)
	track.save
	track.to_json
end

delete '/:id' do

	response['Access-Control-Allow-Origin'] = '*'
	id = params[:id]
	track = Track.find(id)
	track.destroy
	tracks = Track.all
	tracks.to_json
	"success"
end

end