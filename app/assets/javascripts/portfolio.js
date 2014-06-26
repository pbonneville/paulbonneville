$(document).ready(function(){

    function fadeAlert(){
        $('.alert-temp').removeClass('in');
    }

    function removeAlert(){
        $('.alert-temp').slideUp("slow", function() { $('.alert-temp').remove();});
    }

    window.setTimeout(fadeAlert,5000);
    window.setTimeout(removeAlert,5000);

    $('tr[data-link]').click(function() {
        window.location = $(this).data("link")
    })

    $('div[data-link]').click(function() {
        window.location = $(this).data("link")
    })

    $('a.anchor-link').click(function(){
        $('html, body').animate({
            scrollTop: $('[id="' + $.attr(this, 'href').substr(1) + '"]').offset().top - 70
        }, 500);
        return false;
    });

    $('.admin').on('ajax:before', function(event) {
        // insert the failure message inside the "#account_settings" element
        //$('#alerts-and-notices').append(event);
//        alert("Before");
    });
    $('.admin').on('ajax:beforeSend', function(event, xhr, settings) {
        // insert the failure message inside the "#account_settings" element
        //$('#alerts-and-notices').append(xhr.responseText);
//        alert("BeforeSend");
    });
    $('.admin').on('ajax:send', function(event, xhr) {
        // insert the failure message inside the "#account_settings" element
       // $('#alerts-and-notices').append(xhr.responseText);
//        alert("Send");
    });
    $('.admin').on('ajax:success', function(event, data, status, xhr) {
        // insert the failure message inside the "#account_settings" element
        //$('#alerts-and-notices').append(event.toString());
        alert("Success: " + xhr.responseText);
    });
    $('.admin').on('ajax:error', function(event, xhr, status) {
        // insert the failure message inside the "#account_settings" element
        //$('#alerts-and-notices').append(xhr.responseText);
        alert("Error: " + xhr.responseText);
    });
    $('.admin').on('ajax:complete', function(event, status) {
        // insert the failure message inside the "#account_settings" element
        //$('#alerts-and-notices').append(status);
        alert("Complete")
    });
    $('.admin').on('ajax:aborted:required', function(event, elements) {
        // insert the failure message inside the "#account_settings" element
        //$('#alerts-and-notices').append(elements);
//        alert("Aborted:Required");
    });
    $('.admin').on('ajax:aborted:file', function(event, elements) {
        // insert the failure message inside the "#account_settings" element
        //$('#alerts-and-notices').append(elements);
//        alert("Aborted:File");
    });
});