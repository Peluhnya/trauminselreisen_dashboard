(function ($, window, document, undefined) {
    'use strict';

$(document).ready(function(){

	$('.first-level').find('.top-title').click(function(){
		$(this).closest('.first-level').next().toggle();
		$(this).find('.collapse-arrow').toggleClass('collapse-arrow-down collapse-arrow-up');
	})

	$('.second-level-head').find('.second-level-title__inner').click(function(){
		$(this).closest('.second-level-head').next().toggle();
		$(this).find('.collapse-arrow').toggleClass('collapse-arrow-down-black collapse-arrow-up-black');
	})


})

})(jQuery, window, document);