class FloorController < Sinatra::Base
	get '/' do
		Floor.all.to_json
	end

	get '/:id' do
		id = params[:id]
		Floor.find(id).to_json
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