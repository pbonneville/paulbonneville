// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
// require turbolinks
//= require bootstrap
//= require_tree .

$(document).ready(function(){

    function fadeAlert(){
        $('.alert-temp').removeClass('in');
    }

    function removeAlert(){
        $('.alert-temp').slideUp("slow", function() { $('.alert-temp').remove();});
    }

    window.setTimeout(fadeAlert,5000);
    window.setTimeout(removeAlert,5000);

    $('.admin_tr').mouseover(function () {
        $(this).css('background-color', '#f5f5f5');
    });
    $('.admin_tr').mouseleave(function () {
        $(this).css('background-color', '');
    });

    $('tr[data-link]').click(function() {
        window.location = $(this).data("link")
    })
});

$(document).on('page:change', function () {

    $('a').click(function(){
        $('html, body').animate({
            scrollTop: $('[name="' + $.attr(this, 'href').substr(1) + '"]').offset().top - 70
        }, 500);
        return false;
    });

});
