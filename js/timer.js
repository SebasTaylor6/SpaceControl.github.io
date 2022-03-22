function _timer(callback, interval)
{
var time = time || 0;     //  The default time of the timer
var status = 0;    //    Status: timer is running or stoped
var timer_id;    //    This is used by setInterval function
var interval = interval || 1000;
// this will start the timer
this.start = function()
{
            verifyTime();
    if(status == 0)
    {

        status = 1;
        timer_id = setInterval(function()
        {
            switch(1)
            {
                case 1:
                if(time < 86400)
                {
                    time++;
                    generateTime();
                    if(typeof(callback) === 'function') callback(time);
               }
               break;
            }
        }, interval);
    }
}

//  this will stop or pause the timer ex. timer.stop()
this.stop =  function()
{
    if(status == 1)
    {
        status = 0;
        clearInterval(timer_id);
    }
}

// Reset the timer to zero or reset it to your own custom time
this.reset =  function(sec)
{
    time = 0
    generateTime()
}
// This methode return the current value of the timer and sends it to the database
this.getTime = function()
{
    return time;
}
// This methode return the status of the timer
this.getStatus
{
    return status;
}

// This methode will render the time variable to hour:minute:second format
function generateTime()
{
   
    second = time % 60;
    minute = Math.floor(time / 60) % 60;
    hour = Math.floor(time / 3600) % 60;

    second = (second < 10) ? '0'+second : second;
    minute = (minute < 10) ? '0'+minute : minute;
    hour = (hour < 10) ? '0'+hour : hour;

    $('#second').text(second);
    $('#minute').text(minute);
    $('#hour').text(hour);
}
function verifyTime()
{
    var verifySec =  Number($('#second').text());
    second = time % 60;
    verifySec === second ? second = second : time += verifySec - second % 60;
            var verifyMin =  Number($('#minute').text());
            minute = (verifyMin - Math.floor(time / 60)) * 60;
            verifyMin === minute ? minute = minute : time += (verifyMin - Math.floor(time / 60)) * 60;
            var verifyHour = Number($('#hour').text());
            hour = ((verifyHour - Math.floor(time / 3600)) * 60) * 60;
            verifyHour === hour ? hour = hour : time += ((verifyHour - Math.floor(time / 3600)) * 60) * 60;
}
}

var timer;

$(document).ready(function(e)
{
    timer = new _timer
    (
        function(time)
        {
            if(time == 0)
            {
                timer.stop()
            }
        },
        1000
    );
    $('#start').click(timer.start)
    $('#stop').click(timer.stop)
    $('#reset').click(timer.reset)
    $('#hour').focus(timer.stop)
    $('#hour').focusout(timer.start)
    $('#minute').focus(timer.stop)
    $('#minute').focusout(timer.start)
    $('#second').focus(timer.stop)
    $('#second').focusout(timer.start)
});



