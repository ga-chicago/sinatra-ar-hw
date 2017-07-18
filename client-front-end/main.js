//ajax uses http so the client can access the program

$.ajax({
	method: 'GET',
	url: 'http://localhost9393/restaurants/1',
	success: function(response){
			console.log(response)
			$('#name').text(response.restaurant.name);
			$('#address').text(response.restaurant.address);
			$('#cuisine_type').text(response.restaurant.cuisine_type);
			$('#company').text(response.restaurant.company);
			//$('#image_url').attr('src', response[i].image_url);
			for(i = 0; i < response.menus.length; i++){
				$('#menus').append('<li>' + response.menus[i].name + '</li>');
			}
		
	}
})



$.ajax({
	method: 'GET',
	url: 'http://localhost9393/restaurants',
	success: function(response){
		for(i = 0; i < response.length; i++){
			$('#links').append(" <a class='link' href=http://localhost:9393/restaurants/' + response[i].id + "'>")
		}
			$('#name').text(response[i].name);
			$('#address').text(response[i].address);
			$('#cuisine_type').text(response[i].cuisine_type);
			$('#company').text(response[i].company);
			//$('#image_url').attr('src', response[i].image_url);

		
	}
})



$('body').on('click', '.link', function(e){
	e.preventDefault();
	var url = $(this).attr('href');
	$.ajax({
		method: 'GET',
		url: url,
		success: function(response){
			$('#name').text(response[i].name);
			$('#address').text(response[i].address);
			$('#cuisine_type').text(response[i].cuisine_type);
			$('#company').text(response[i].company);
			//$('#image_url').attr('src', response[i].image_url);
		}
	}

})





















