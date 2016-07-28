$(document).ready(function () {
	$("#user-profile-button, #user-profile-menu").hover(function(){
		$("#user-profile-menu").show();
    }, function(){
    $("#user-profile-menu").hide();
	});

	$("#user-host-button, #user-host-menu").hover(function(){
		$("#user-host-menu").show();
    }, function(){
    $("#user-host-menu").hide();
	});

	$("#search-bar-input").autocomplete({ 
		source: "/autocomplete"
	});


	$("#signup-button").click(function () {
		$("#signup-form").show();
		$("#signup-form-overlay").show();
	});

	$("#login-button").click(function () {
		$("#login-form").show();
		$("#signup-form-overlay").show();
	});

	$("#signup-form-overlay").click(function () {
		$("#login-form").hide();
		$("#signup-form").hide();
		$("#signup-form-overlay").hide();
	});

});


	// $('#search-bar-input').on('input', function() {
 //    $.ajax({
 //    	event.preventDefault
 //      type: "GET",
 //      url: "/autocomplete",
 //      data: $("#search-bar-input").serialize(),
 //      success: function(data) {
	// 			$("#live-search-results").show();
 //        htmlString = ""
 //      	$.each(data, function(index, json){
 //        	nameString = json.location
 //        	htmlString = htmlString + "<p>" + nameString + "</p>"
 //      	})

 //  			$("#live-search-results").html(htmlString); // replace the "results" div with the results

 //      },
 //      error: function() {
 //        $("#live-search-results").hide();
 //      }
	// 	});
	// });
