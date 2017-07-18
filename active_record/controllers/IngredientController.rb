class IngredientController < Sinatra::Base
	get '/' do
		response['Access-Control-Allow-Origin'] = '*'
    	content_type :json
		Ingredient.all.to_json
	end

	get '/:id' do
		response['Access-Control-Allow-Origin'] = '*'
    	content_type :json
		id = params[:id]
		Ingredient.find(id).to_json
		burgers = ingredient.burgers
		{ingredient: ingredient, burgers: burgers}.to_json
	end

	post '/' do
		response['Access-Control-Allow-Origin'] = '*'
    	content_type :json
		request_body = JSON.parse(request.body.read)
		ingredient = Ingredient.new(request_body)
		ingredient.save
		ingredient.to_json
	end

	patch '/:id' do
		response['Access-Control-Allow-Origin'] = '*'
    	content_type :json
		id = params[:id]
		ingredient = Ingredient.find(id)
		request_body = JSON.parse(request.body.read)
		ingredient.update_attributes(request.body)
		ingredient.save
		ingredient.to_json
	end

	delete '/:id' do
		response['Access-Control-Allow-Origin'] = '*'
    	content_type :json
		id = params[:id]
		ingredient = Ingredient.find(id)
		ingredient.destroy
		ingredients = Ingredient.all
		ingredients.to_json
	end
end
