var updatePerson = function(url) {
	$.ajax({
		method: "GET",
		url: url,
		success: function(response) {
			$("#name").text(response.name);
			$("#room_number").text(response.room_number);
		}
	});
};

var updateFloor = function(url) {
	$.ajax({
		method: "GET",
		url: url,
		success: function(response) {
			$("#floor_number").text(response.number);
			$("#private").text(response.private);
		}
	});
}

$("#people-list a").on("click", function(e) {
	e.preventDefault();
	var url = $(this).attr("href");
	updatePerson(url);
})

$("#floors-list a").on("click", function(e) {
	e.preventDefault();
	var url = $(this).attr("href");
	updateFloor(url);
})

updatePerson("http://localhost:9393/people/1");
updateFloor("http://localhost:9393/floors/1");