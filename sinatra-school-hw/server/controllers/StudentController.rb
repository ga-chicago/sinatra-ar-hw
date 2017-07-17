class StudentController < Sinatra::Base
  get '/' do
    response['Access-Control-Allow-Origin'] = '*'
    students = Student.all
    students.to_json
  end

  get '/:id' do
    response['Access-Control-Allow-Origin'] = '*'
    id = params[:id]
    student = Student.find(id)
    teacher = student.teacher
    {student: student, teacher: teacher}.to_json
  end

  post '/' do
    response['Access-Control-Allow-Origin'] = '*'
    request_body = JSON.parse(request.body.read)
    new_student = Student.new(request_body)
    new_student.save
    new_student.to_json
    "nice!"
  end

  patch '/:id' do
    response['Access-Control-Allow-Origin'] = '*'
    id = params[:id]
    request_body = JSON.parse(request.body.read)
    student = Student.find(id)
    student.update_attributes(request_body)
    student.save
    student.to_json
  end

  delete '/:id' do
    response['Access-Control-Allow-Origin'] = '*'
    id = params[:id]
    student = Student.find(id)
    student.destroy
    students = Student.all
    students.to_json
  end
end
