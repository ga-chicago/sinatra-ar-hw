class UserController < Sinatra::Base
	post '/register' do 
		user_info = JSON.parse(request.body.read)
		user = User.new(user_info)
		user.save
		user.to_json
	end

	post '/login' do
		user_info = JSON.parse(request.body.read)
		user = User.find_by({username: user_info["username"]})
		if user && user.authenticate(user_info["password"])
			"Access Granted"
		else
			"Access Denied"
		end
	end
end