class CdController < Sinatra::Base
  get '/' do
    cds = Cd.all
    cds.to_json
  end

  get '/:id' do
    id = params[:id]
    cd = Cd.find(id)
    cd.to_json
  end

  post '/' do
    request_body = JSON.parse(request.body.read)
    new_cd = Cd.new(request_body)
    new_cd.save
    new_cd.to_json
    "nice!"
  end

  patch '/:id' do
    id = params[:id]
    request_body = JSON.parse(request.body.read)
    cd = Cd.find(id)
    cd.update_attributes(request_body)
    cd.save
    cd.to_json
  end

  delete '/:id' do
    id = params[:id]
    cd = Cd.find(id)
    cd.destroy
    cds = Cd.all
    cds.to_json
  end
end
