$.ajax({
  method: 'GET',
  url: 'http://localhost:9393/teachers/1',
  success: function(response){
    // take everyone's data and list it out on the teachers page
    for (var i = 0; i < response.teachers.length; i++){
      $('#name').text(response.teachers.name[i]);
      $('#subject').text(response.teachers.subject[i]);
      $('#image_url').attr('img', response.teachers.image_url[i]); // or .eq(i)?
    }
  }
})

// $('body').on('click', '.link', function(e){
//   e.preventDefault();
//   var teacherUrl = $(e.target).attr('href')

$.ajax({
  method: 'GET',
  url: 'http://localhost:9393/students/1',
  success: function(response){
    for (var i = 0; i < response.students.length; i++){
      $('#name').text(response.students.name[i])
      $('#grade').text(response.students.grade[i])
      $('#student_num').text(response.students.student_num[i])
    }
  }
})



// $.ajax({
//   method: 'GET',
//   url: 'http://localhost:9393/comments',
//   success: function(response){
//     $('#')
//   }
// })
