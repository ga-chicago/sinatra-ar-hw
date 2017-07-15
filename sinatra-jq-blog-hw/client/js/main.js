$.ajax({
  method: 'GET',
  url: 'http://localhost:9393/books/json',
  success: function(response){
    $('#book-title').append('<li>'+response.name+'</li>')
  }
})
