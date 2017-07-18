class TeacherController < Sinatra::Base
  get '/' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    teachers = Teacher.all
    teachers.to_json
  end

  get '/:id' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    id = params[:id]
    token = params[:token]
    # user = User.find_by({token: token})
    # if user
      teacher = Teacher.find(id)
      students = teacher.students
    # end
    {teacher: teacher, students: students}.to_json
  end

  post '/' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    request_body = JSON.parse(request.body.read)
    new_teacher = Teacher.new(request_body)
    new_teacher.save
    new_teacher.to_json
    "nice!"
  end

  patch '/:id' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    id = params[:id]
    request_body = JSON.parse(request.body.read)
    teacher = Teacher.find(id)
    teacher.update_attributes(request_body)
    teacher.save
    teacher.to_json
  end

  delete '/:id' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    id = params[:id]
    teacher = Teacher.find(id)
    teacher.destroy
    teachers = Teacher.all
    teachers.to_json
  end
end
