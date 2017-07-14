class TypeController < Sinatra::Base


	get '/' do
		  response['Access-Control-Allow-Origin'] = '*'
  content_type :json

		types = Types.all

		types.to_json
	end

	get '/:id' do
		  response['Access-Control-Allow-Origin'] = '*'
  content_type :json

		id = params[:id]
		type = Types.find(id)
		type.to_json


	end


	post '/' do 
		# creat a new model user request body
		request_body = JSON.parse(request.body.read)
		p request_body

		new_type = Types.new(request_body)

		new_type.save
		new_type.to_json


		"success"


	end

	patch '/:id' do

		id = params[:id]

		type = Types.find(id)

		request_body = JSON.parse(request.body.read)
		type.update_attributes(request_body)
		type.save
		type.to_json

	end

	delete '/:id' do

		id = params[:id]
			type = Types.find(id)

			type.destroy
			types = Types.all
			types.to_json

	end
end	

