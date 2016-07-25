$(document).ready(function () {

	$("#filters-button").click(function () {
		$("#filters-menu").toggle();
	})

  clicks = 0;
  target = "#listing-photo-" + String(clicks);
  next_target = "#listing-photo-" + String(clicks + 1);

  $("#listing-photo-container").click(function () {
    $(target).hide();
    $(next_target).show();
    clicks += 1;
    target = "#listing-photo-" + String(clicks);
    next_target = "#listing-photo-" + String(clicks + 1);
  })



$('input[name="daterange"]').daterangepicker({
    locale: {
      format: 'DD-MM-YYYY'
    },
    startDate: '01-08-2016',
    endDate: '31-08-2016'
});




// $(window).scroll(function() {
//    if($(window).scrollTop() + $(window).height() > $(document).height() - 100) {
//       event.preventDefault();
//       $.ajax({
//       type: "GET",
//       url: "/listings/filter_search",
//       data: $("#filter-search-form").serializeArray(),
//       success: function(data) {
//         htmlString = ""
//         $.each(data, function(index, json){
//           nameString = json.name
//           htmlString = htmlString + "<p>" + nameString + "</p>"
//         })

//         $("#container").html(htmlString); // replace the "results" div with the results

//       },
//     });
//   }
// }


	$("#apply-filters-button").click(function () {
		event.preventDefault();
		$.ajax({
      type: "GET",
      url: "/listings/filter_search",
      data: $("#filter-search-form").serializeArray(),
      success: function(data) {
        htmlString = ""
      	$.each(data, function(index, json){
        	nameString = json.name
        	htmlString = htmlString + "<p>" + nameString + "</p>"
      	})

  			$("#container").html(htmlString); // replace the "results" div with the results

      },
		});
	})

});
