$(document).ready(function () {

	$("#signup-button").click(function () {
		$("#signup-form").show();
		$("#signup-form-overlay").show();
	})

	$("#login-button").click(function () {
		$("#login-form").show();
		$("#signup-form-overlay").show();
	})

	$("#signup-form-overlay").click(function () {
		$("#login-form").hide();
		$("#signup-form").hide();
		$("#signup-form-overlay").hide();
	})


	$('#search-bar-input').on('input', function() {
    $.ajax({
      type: "GET",
      url: "/listings/live_search",
      data: $("#search-bar-input").serializeArray()[0],
      success: function(data) {
				$("#live-search-results").show();
        htmlString = ""
      	$.each(data, function(index, json){
        	nameString = json.location
        	htmlString = htmlString + "<p>" + nameString + "</p>"
      	})

  			$("#live-search-results").html(htmlString); // replace the "results" div with the results

      },
      error: function() {
        $("#live-search-results").hide();
      }
		});
	});

});