$.ajax({
  method: 'GET',
  url: 'http://localhost:9393/libraries/1',
  success: function(response){
      console.log(response.books[1].title)
      $('#name').text(response.library.name);
      $('#address').text(response.library.address);
      $('#image_url').attr('src',response.library.image_url);
      for(i = 0; i < response.books.length; i++){
        $('#books').append('<li>' + response.books[i].title + '</li>');
      }
  }
})

$.ajax({
  method: 'GET',
  url: 'http://localhost:9393/libraries',
  success: function(response){
    for(i = 0; i < response.length; i++){
      $('#links').append(" <a class='link' href='http://localhost:9393/libraries/" + response[i].id + "'>"+ response[i].name + "</a>" )
    }
      $('#name').text(response.name);
      $('#address').text(response.address);
      $('#image_url').attr('src',response.image_url);
  }
})

$('body').on('click','.link',function(e){
  e.preventDefault();
  var url = $(e.target).attr('href');
  $.ajax({
    method: 'GET',
    url: url,
    success: function(response){
      $('#books').empty()
      console.log("button was clicked!")
      console.log(response)
      $('#name').text(response.library.name);
      $('#address').text(response.library.address);
      $('#image_url').attr('src',response.library.image_url);
      for(i = 0; i < response.books.length; i++){
        $('#books').append('<li>' + response.books[i].title + '</li>');
      }
    }
  })
})
