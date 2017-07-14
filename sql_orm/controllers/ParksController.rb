class ParksController < Sinatra::Base	
	get '/' do
		  response['Access-Control-Allow-Origin'] = '*'
  content_type :json

		parks = Parks.all
		parks.to_json
		
	end

	get '/:id' do
		  response['Access-Control-Allow-Origin'] = '*'
  content_type :json

		id = params[:id]
		park = Parks.find(id)
		park.to_json
		
	end

	post '/' do

	request_body = JSON.parse(request.body.read)

	parks = Parks.new(request_body)

	parks.save
	parks.to_json

	end

	patch '/:id' do

		id = params[:id]
		park = Parks.find(id)
		request_body = JSON.parse(request.body.read)
		park.update_attributes(request_body)
		park.save
		park.to_json
	end

	delete '/:id' do

		id = params[:id]
		park = Parks.find(id)
		park.destroy
		parks = Parks.all
		parks.to_json

	end
end


