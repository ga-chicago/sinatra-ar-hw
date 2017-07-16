class PersonController < Sinatra::Base
	get '/' do
		response["Access-Control-Allow-Origin"] = "*"
		content_type :json
		Person.all.to_json
	end

	get '/:id' do
		response["Access-Control-Allow-Origin"] = "*"
		content_type :json
		id = params[:id]
		Person.find(id).to_json
	end

	post '/' do
		request_body = JSON.parse(request.body.read)
		person = Person.new(request_body)
		person.save
		person.to_json
	end

	patch '/:id' do
		id = params[:id]
		request_body = JSON.parse(request.body.read)
		person = Person.find(id)
		person.update_attributes(request_body)
		person.save
		person.to_json
	end

	delete '/:id' do
		id = params[:id]
		person = Person.find(id)
		person.destroy
		Person.all.to_json
	end
end