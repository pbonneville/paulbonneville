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
        $(this).addClass('highlight');
    });
    $('.admin_tr').mouseleave(function () {
        $(this).removeClass('highlight');
    });

    $('tr[data-link]').click(function() {
        window.location = $(this).data("link")
    })

    $('div[data-link]').click(function() {
        window.location = $(this).data("link")
    })

    $('a').click(function(){
        $('html, body').animate({
            scrollTop: $('[name="' + $.attr(this, 'href').substr(1) + '"]').offset().top - 70
        }, 500);
        return false;
    });
});