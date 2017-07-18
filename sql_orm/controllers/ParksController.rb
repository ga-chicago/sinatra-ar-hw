 class ParksController < Sinatra::Base	
	get '/' do
		  response['Access-Control-Allow-Origin'] = '*'
  content_type :json

		parks = Parks.all
		parks.to_json
		
	end

	get '/:id/:token' do
		  response['Access-Control-Allow-Origin'] = '*'
  content_type :json

		id = params[:id]
		token = params[:token]
		user = User.find_by({token: token})
		if user
		park = Parks.find(id)
		# member = Member.find(id)
		types = park.types
		#put them in a has and return json
		{parks: park, types: types}.to_json
		#park.to_json

		else

			"ACCESS DENIED YOU MAY NOT PASS"
		end
		
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


