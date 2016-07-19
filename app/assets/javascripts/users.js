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

});