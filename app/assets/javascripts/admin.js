var resetTimerFunction;

$(function(){

    var mainTimer = 0;
    var subTimer = 0;
    var userLogedIn = $("#user_loged_in").val()

    function dialog_set_interval(){
        mainTimer = setInterval(function(){
            if(userLogedIn == "true"){
                $("#inactivity_warning").modal("show");
                subTimer = setInterval(function(){
                    $("#user_activity").val("inactive")
                },30000);
            }
        },3540000);
    }

    resetTimerFunction = function(){
        clearInterval(mainTimer);
        dialog_set_interval();
    }

    $(".inactivity_ok").click(function(){
        clearInterval(subTimer);
        if($("#user_activity").val() == "inactive"){
            window.location = window.location
        }
    });

    $('.admin_tr').mouseover(function () {
        $(this).addClass('highlight');
    });
    $('.admin_tr').mouseleave(function () {
        $(this).removeClass('highlight');
    });

});

function set_up_timer() {
    document.onmousemove = resetTimerFunction;
    document.onkeypress = resetTimerFunction;
}