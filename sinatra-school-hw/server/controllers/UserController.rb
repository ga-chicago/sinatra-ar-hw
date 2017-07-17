class UserController < Sinatra::Base
  post '/register' do
    user_details = JSON.parse(request.body.read)
    user = User.new(user_details)
    user.save
    user.to_json
  end

  post '/login' do
    user_details = JSON.parse(request.body.read)
    user = User.find_by({username: user_details["username"]})
    if user && user.authenticate(user_details["password"])
      "ACCESS GRANTED"
    else
      "ACCESS DENIED"
    end
  end
end
