/// Any calling object should have a variable called xspd that represents number of pixels to move each time script is called

var mode, xs;   // mode allows for parameterization of the motion; xs is sign(xspd). simply used for caching and shorthand

if (argument_count == 0) {  // no arguments means pick default mode (normal movement, up/down slopes, etc
    mode = 0;   // mode 0 is normal motion
} else {
    mode = argument[0]; // other modes include (-1 ignore collisions), and (1 don't walk off cliffs)
}

/// @TODO: add slope tolerance for angle of climb
/// @TODO: add slowdown/speedup for hills

xs = sign(xspd);    // this is just shorthand

switch (mode) {
    case 0: // normal motion
    case 1: // "groundlock" the motion, so you can't walk off cliffs
        repeat (abs(xspd)) {    // each iteration of this loop should move one pixel
            if (!place_meeting(x + xs, y + 1, Solid) && place_meeting(x + xs, y + 2, Solid)) {  // if there is a slope facing downwards
                x += xs;    // move forward
                y += 1;     // and down
            } else if (!place_meeting(x + xs, y, Solid)) {  // there's not a slope below to stick to, so just go forward?
                if (!mode || place_meeting(x + xs, y + 1, Solid)) { // only if you're not groundlocked or there is ground beneath you anyway
                    x += xs;    // move forward
                } else {
                    xspd = 0;   // you've been groundlocked, exit the loop
                }
            } else if (!place_meeting(x + xs, y - 1, Solid)) {  // you couldn't move forward, can you go uphill?
                x += xs;    // forward
                y -= 1;     // and upward!
            } else {
                xspd = 0;   // there's a wall of some sort in your way, stop.
            }
        }
        break;
    case -1:    // just move, ignore all collisions
        repeat (abs(xspd)) { x += xs; };    // like so!
        break;
}
