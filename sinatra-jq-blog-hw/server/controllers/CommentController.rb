class CommentController < Sinatra::Base
  get '/' do
    comments = Comment.all
    comments.to_json
  end

  get '/:id' do
    id = params[:id]
    comment = Comment.find(id)
    comment.to_json
  end

  post '/' do
    request_body = JSON.parse(request.body.read)
    new_comment = Comment.new(request_body)
    new_comment.save
    new_comment.to_json
    "nice!"
  end

  patch '/:id' do
    id = params[:id]
    request_body = JSON.parse(request.body.read)
    comment = Comment.find(id)
    comment.update_attributes(request_body)
    comment.save
    comment.to_json
  end

  delete '/:id' do
    id = params[:id]
    comment = Comment.find(id)
    comment.destroy
    comments = Comment.all
    comments.to_json
  end
end
