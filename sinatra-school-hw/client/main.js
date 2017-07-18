console.log('test')
$.ajax({
  method: 'GET',
  url: 'http://localhost:9393/teachers/',
  success: function(response){
    // take everyone's data and list it out on the teachers page
    $('#tch_name').text(response.teachers.name);
    console.log(response)
    $('#subject').text(response.teachers.subject);
    $('#image_url').attr('src', response.teachers.image_url); // or .eq(i)?
    // for (var i = 0; i < response.length ; i++){
    //   $('#students').append('<li>'+response.students[i].name+'</li>')
    // }
    // console.log(response)
  }
})

// $('body').on('click', '.link', function(e){
//   e.preventDefault();
//   var teacherUrl = $(e.target).attr('href')

$.ajax({
  method: 'GET',
  url: 'http://localhost:9393/students/',
  success: function(response){
    // for (var i = 0; i < response.length; i++){
      $('#stu_name').text(response.students.name)
      $('#grade').text("Grade: " + response.students.grade)
      $('#student_num').text(response.students.student_num)
      $('#has_teachers').append('<li>'+response.teachers.name+'</li>')
      console.log(response)
    // }
  }
})



// $.ajax({
//   method: 'GET',
//   url: 'http://localhost:9393/comments',
//   success: function(response){
//     $('#')
//   }
// })
