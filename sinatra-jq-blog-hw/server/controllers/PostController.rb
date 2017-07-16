class PostController < Sinatra::Base
  get '/' do
    posts = Post.all
    posts.to_json
  end

  get '/:id' do
    id = params[:id]
    post = Post.find(id)
    post.to_json
  end

  post '/' do
    request_body = JSON.parse(request.body.read)
    new_post = Post.new(request_body)
    new_post.save
    new_post.to_json
    "nice!"
  end

  patch '/:id' do
    id = params[:id]
    request_body = JSON.parse(request.body.read)
    post = Post.find(id)
    post.update_attributes(request_body)
    post.save
    post.to_json
  end

  delete '/:id' do
    id = params[:id]
    post = Post.find(id)
    post.destroy
    posts = Post.all
    posts.to_json
  end
end
