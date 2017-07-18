$.ajax({
	method: 'GET',
	url: 'http://localhost:9393/burgers/3',
	success: function(response){
		$('#name').text(response.burger.name);
		$('#restaurant').text(response.burger.restaurant);
		$('#calories').text(response.burger.calories);
		for(i = 0; i < response.ingredients.length; i++){
			$('#ingredients').append('<li>' + response.ingredients[i].name + '</li>');
		}
	}
})

