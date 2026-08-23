inlets = 1;
outlets = 1;

// message arrives as selector "/Sequencer/x/y" + value z
function anything() {
    var track = parseInt(messagename.split("/")[2]); // x
    var step  = parseInt(messagename.split("/")[3]); // y
    var val   = parseInt(arguments[0]);                          // z
    outlet(0, step-1, track-1, val);   // matrixctrl wants: column row value
}