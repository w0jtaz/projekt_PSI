function gettheDate() {
    Todays = new Date();
    TheDate = "" + (Todays.getDate()) + " / " + (Todays.getMonth() + 1) + " / " + (Todays.getYear() + 1900);
    document.getElementById("data").innerHTML = TheDate;
}

var timerID = null;
var timerRunning = false;

function stopclock() {
    if (timerRunning)
        clearTimeout(timerID);
    timerRunning = false;
}


function startclock() {
    stopclock();
    gettheDate();
    showtime();
}


function showtime() {
    var now = new Date();
    var hours = now.getHours();
    var minutes = now.getMinutes();
    var seconds = now.getSeconds()
    var timeValue = "" + ((hours > 12) ? hours - 12 : hours)
    timeValue += ((minutes < 10) ? ":0" : ":") + minutes
    timeValue += ((seconds < 10) ? ":0" : ":") + seconds
    timeValue += (hours >= 12) ? " P.M." : "A.M."
    document.getElementById("zegarek").innerHTML = timeValue;
    timerID = setTimeout("showtime()", 1000)
    timerRunning = true;
}