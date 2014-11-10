'use strict';
/* global $ */

// Example of file included that will be browserified
require('./misc/console-fix');

$('[data-effect="auto"] a, *[data-effect="scroll"]').click(function(e) {
    e.preventDefault();
    var target = $(this).attr('href');
    $('html, body').animate({
        scrollTop: $(target).offset().top
    }, 700);
});