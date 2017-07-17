class TeacherController < Sinatra::Base
  get '/' do
    response['Access-Control-Allow-Origin'] = '*'
    teachers = Teacher.all
    teachers.to_json
  end

  get '/:id' do
    response['Access-Control-Allow-Origin'] = '*'
    id = params[:id]
    teacher = Teacher.find(id)
    students = teacher.students
    p students "this is students"
    {teacher: teacher, students: students}.to_json
  end

  post '/' do
    response['Access-Control-Allow-Origin'] = '*'
    request_body = JSON.parse(request.body.read)
    new_teacher = Teacher.new(request_body)
    new_teacher.save
    new_teacher.to_json
    "nice!"
  end

  patch '/:id' do
    response['Access-Control-Allow-Origin'] = '*'
    id = params[:id]
    request_body = JSON.parse(request.body.read)
    teacher = Teacher.find(id)
    teacher.update_attributes(request_body)
    teacher.save
    teacher.to_json
  end

  delete '/:id' do
    response['Access-Control-Allow-Origin'] = '*'
    id = params[:id]
    teacher = Teacher.find(id)
    teacher.destroy
    teachers = Teacher.all
    teachers.to_json
  end
end
