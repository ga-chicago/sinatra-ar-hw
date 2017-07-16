$('.albumLink').click(function(e){
	e.preventDefault();//stops us from following the href
	var getUrl = $(e.target).attr('href')

$.ajax({

	method: 'GET',
	url: getUrl,
	success: function(response){
		var parse = jQuery.parseJSON(response);
		$('#data').empty();
		for (i = 0; i < parse.length; i++){

			var band = parse[i].band;
			var title = parse[i].title;
			var release_date = parse[i].release_date;
			var no_of_songs = parse[i].no_of_songs;
			var cover = parse[i].cover;

			console.log(cover);

			$('#image').append('<img>')
			$("img").eq(i).attr('src', cover)
			$('#data').append('<li>' + band + " " + title + " " + release_date + " " + no_of_songs)
			}

		}
	})
});

$('.tracksLink').click(function(e){
	e.preventDefault();//stops us from following the href
	var getUrl = $(e.target).attr('href')

$.ajax({

	method: 'GET',
	url: getUrl,
	success: function(response){
		var parse = jQuery.parseJSON(response);
		$('#data').empty();
		for (i = 0; i < parse.length; i++){

			var name = parse[i].name;
			var time = parse[i].time;
			var track_order = parse[i].track_order;
		


			$('#data').append('<li>' + name + " " + time + " " + track_order)
			}

		}
	})
});