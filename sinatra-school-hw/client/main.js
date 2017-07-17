$.ajax({
  method: 'GET',
  url: 'http://localhost:9393/posts',
  success: function(response){
    for (var i = 0; i<response.length; i++){
      $('#posts').append('<li><a class="link" href=http://localhost:9393/posts/'+response.id[i]+'>'+response.title[i]+'</a><li>')
    }
  }
})

$('body').on('click', '.link', function(e){
  e.preventDefault();
  var postUrl = $(e.target).attr('href')

  $.ajax({
    method: 'GET',
    url: postUrl,
    success: function(response){
      $('#posts').empty()
      for (var i = 0; i<response.length;i++){
        $('#title').append(response.title[i])
        $('#topic').append(response.topic[i])
        $('#preview').append(response.preview[i])
        $('#time_to_read').append(response.time_to_read[i])
      }
    }
  }
  )
})


// $.ajax({
//   method: 'GET',
//   url: 'http://localhost:9393/comments',
//   success: function(response){
//     $('#')
//   }
// })
