class UserController < Sinatra::Base

	post '/register' do
		request_body = JSON.parse(request.body.read)
		user = User.new(request_body)
		user.token = rand(1..99999999)
		user.save
		user.to_json
	end

	post '/login' do
		request_body = JSON.parse(request.body.read)
		user = User.find_by('username': request_body['username'])
		if user && user.authenticate(request_body['password'])
			"you're logged in now"
		else
			"you failed :("
		end
	end

end