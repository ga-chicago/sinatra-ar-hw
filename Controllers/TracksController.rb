class TracksController < Sinatra::Base

get '/tracks'  do

	tracks = Track.all
	tracks.to_json
	
end

get '/tracks/:id' do
	id = params[:id]
	track = Track.find(id)
	track.to_json
end

post '/tracks' do

	new_track = JSON.parse(request.body.read)
	track = Track.new(new_track)
	track.save
	track.to_json

	"success"
end






end