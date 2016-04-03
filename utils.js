.pragma library

function geTimeStringFromPosition(position) {
    var hours = Math.floor(position / 3600000);
    var minutes = Math.floor(position / 60000) - (hours * 60);
    var seconds = Math.floor(position / 1000) - (hours * 3600 + minutes * 60);

    var timeString = hours < 10 ? "0" + hours : hours;
    timeString += ":";
    timeString += minutes < 10 ? "0" + minutes : minutes;
    timeString += ":";
    timeString += seconds < 10 ? "0" + seconds : seconds;

    return timeString;
}

function getResolutionIndex(pixelDensity) {

    // images for different device densities are determined by the device's pixel density
    if (pixelDensity < 6.3)
        return 0; // mdpi
    else if (pixelDensity < 9.5)
        return 1; // hdpi
    else if (pixelDensity < 12.6)
        return 2; // xhdpi

    // anything larger use xxhdpi
    return 3;


}
