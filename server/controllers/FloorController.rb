class FloorController < Sinatra::Base
	get '/' do
		response["Access-Control-Allow-Origin"] = "*"
		content_type :json
		Floor.all.to_json
	end

	get '/:id' do
		response["Access-Control-Allow-Origin"] = "*"
		content_type :json
		id = params[:id]
		floor = Floor.find(id)
		people = floor.people
		{floor: floor, people: people}.to_json
	end

	post '/' do
		request_body = JSON.parse(request.body.read)
		floor = Floor.new(request_body)
		floor.save
		floor.to_json
	end

	patch '/:id' do
		id = params[:id]
		request_body = JSON.parse(request.body.read)
		floor = Floor.find(id)
		floor.update_attributes(request_body)
		floor.save
		floor.to_json
	end

	delete '/:id' do
		id = params[:id]
		floor = Floor.find(id)
		floor.destroy
		Floor.all.to_json
	end
end