autowatch = 1;
inlets = 1;
outlets = 1;

var STEPS = 16;
var ADDR = "/Led/led";   // OSC address prefix — edit to match your controller

// current step (0–15): "on" for it, "off" for the previous step
function msg_int(step) {
    step = ((step % STEPS) + STEPS) % STEPS;   // guard/wrap the input
    var prev = (step - 1 + STEPS) % STEPS;     // step - 1, wrapped (15 when step is 0)
    step++;
    prev++;

    outlet(0, ADDR + step, 1);           // on  -> e.g. "/step/5 1"
    outlet(0, ADDR + prev, 0);           // off -> e.g. "/step/4 0"
}

function msg_float(f) { msg_int(Math.round(f)); }  // in case the step arrives as a float