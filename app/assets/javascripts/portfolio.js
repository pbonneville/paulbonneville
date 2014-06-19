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

    $('a').click(function(){
        $('html, body').animate({
            scrollTop: $('[name="' + $.attr(this, 'href').substr(1) + '"]').offset().top - 70
        }, 500);
        return false;
    });
});