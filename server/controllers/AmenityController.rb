class AmenityController < Sinatra::Base
	get '/' do
		response["Access-Control-Allow-Origin"] = "*"
		content_type :json
		Amenity.all.to_json
	end

	get '/:id' do
		response["Access-Control-Allow-Origin"] = "*"
		content_type :json
		id = params[:id]
		amenity = Amenity.find(id)
		people = amenity.people
		{amenity: amenity, people: people}.to_json
	end

	post '/' do
		request_body = JSON.parse(request.body.read)
		amenity = Amenity.new(request_body)
		amenity.save
		amenity.to_json
	end

	patch '/:id' do
		id = params[:id]
		request_body = JSON.parse(request.body.read)
		amenity = Amenity.find(id)
		amenity.update_attributes(request_body)
		amenity.save
		amenity.to_json
	end

	delete '/:id' do
		id = params[:id]
		amenity = Amenity.find(id)
		amenity.destroy
		Amenity.all.to_json
	end
end