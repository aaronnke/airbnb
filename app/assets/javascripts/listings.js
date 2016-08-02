$(document).ready(function () {

  $(window).scroll(function(event) {
   if($(window).scrollTop() + $(window).height() > $(document).height() - 10) {
      more_posts_url = $('.pagination .next a').attr('href')
      $('.pagination').html('asd')
      $.getScript(more_posts_url)
    }
  });


	$("#filters-button").click(function () {
		$("#filters-menu").toggle();
	});

  clicks = 0;
  target = "#listing-photo-" + String(clicks);
  next_target = "#listing-photo-" + String(clicks + 1);

  $("#listing-photo-container").click(function () {
    $(target).hide();
    $(next_target).show();
    clicks += 1;
    target = "#listing-photo-" + String(clicks);
    next_target = "#listing-photo-" + String(clicks + 1);
  });



date = new Date();
day = date.getDate();
month = date.getMonth()+1;
year = date.getFullYear();
fullDate = day + "-" + month + "-" + year;


$("#search-dates").daterangepicker({
    locale: {
      format: 'DD-MM-YYYY'
    },
    startDate: fullDate,
    endDate: fullDate
});

$("input[name='daterange']").daterangepicker({
    locale: {
      format: 'DD-MM-YYYY'
    },
    startDate: fullDate,
    endDate: fullDate
});


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
