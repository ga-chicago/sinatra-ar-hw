$.ajax({

	method: 'GET',
	url:'http://localhost:9393/parks',
	success: function(response){

		console.log(response);
		$('#park_name').text(response[0].name);

		$('#park_location').text(response[0].location)

			$('#park_sqft').text(response[0].sqft)

	}



})

$('.link').click(function(e){

	e.preventDefault();

	 var myUrl = $(e.target).attr('href')

	 $.ajax({

	method: 'GET',
	url: myUrl,
	success: function(response){

		console.log(response);
		$('#park_name').text(response.name);

		$('#park_location').text(response.location)

			$('#park_sqft').text(response.sqft)

			

	}



})


$('.link_two').click(function(e){

	e.preventDefault();

	var myUrl2 = $(e.target).attr('href')
	 $.ajax({

	method: 'GET',
	url: myUrl2,
	success: function(response){

		//console.log(response);
		$('#type').text(response.name);


			

	}



})



})




})
