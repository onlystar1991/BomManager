// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function() {
	$( document.body ).on( 'click', '.dropdown-menu li', function( event ) {

		var $target = $(event.currentTarget);

		$target.closest('.btn-group')
			.find('[data-bind="label"]').text($target.text())
			.end()
			.children('.dropdown-toggle').dropdown('toggle');

		return false;

	});
	
	$(window).resize(function() {
		if ($('body').width() < 1188) {
			if ($('.col-max-7').hasClass('col-md-7')) {
				$('.col-max-7').removeClass('col-md-7');
				$('.col-max-7').addClass('col-md-12');
			}

			if ($('.col-max-5').hasClass('col-md-5')) {
				$('.col-max-5').removeClass('col-md-5');
				$('.col-max-5').addClass('col-md-12');
			}
		} else {
			if ($('.col-max-7').hasClass('col-md-12')) {
				$('.col-max-7').removeClass('col-md-12');
				$('.col-max-7').addClass('col-md-7');
			}
			if ($('.col-max-5').hasClass('col-md-12')) {
				$('.col-max-5').removeClass('col-md-12');
				$('.col-max-5').addClass('col-md-5');
			}
		}
	})
})