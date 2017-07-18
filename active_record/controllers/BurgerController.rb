class BurgerController < Sinatra::Base
	get '/' do
		response['Access-Control-Allow-Origin'] = '*'
    	content_type :json
		Burger.all.to_json
	end

	get '/:id' do
		response['Access-Control-Allow-Origin'] = '*'
    	content_type :json
		id = params[:id]
		burger = Burger.find(id)
		ingredients = burger.ingredients
		{burger: burger, ingredients: ingredients}.to_json
	end

	post '/' do
		response['Access-Control-Allow-Origin'] = '*'
    	content_type :json
		request_body = JSON.parse(request.body.read)
		burger = Burger.new(request_body)
		burger.save
		burger.to_json
	end

	patch '/:id' do
		response['Access-Control-Allow-Origin'] = '*'
    	content_type :json
		id = params[:id]
		burger = Burger.find(id)
		request_body = JSON.parse(request.body.read)
		burger.update_attributes(request_body)
		burger.save
		burger.to_json
	end

	delete '/:id' do
		response['Access-Control-Allow-Origin'] = '*'
    	content_type :json
		id = params[:id]
		burger = Burger.find(id)
		burger.destroy
		burgers = Burger.all
		burgers.to_json
	end
end