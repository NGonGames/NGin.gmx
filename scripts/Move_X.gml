var mode, xs, force_x;   // mode allows for parameterization of the motion; xs is sign(force_x). simply used for caching and shorthand

/// @TODO: Add force argument to all calls of this function

if (argument_count == 0) {  // no arguments means pick default mode (normal movement, up/down slopes, etc
    mode = 0;   // normal mode!!
} else if (argument_count == 1) {
    mode = argument[0];    // agg is a force aggregator object
    mode = 0;   // normal mode!!
} else if (argument_count == 2) {
    show_error("Too many args!?!?!", 0);
}

/// @TODO: add slope tolerance for angle of climb
/// @TODO: add slowdown/speedup for hills

force_x = vel.x;
xs = sign(vel.x);    // this is just shorthand

switch (mode) {
    case 0: // normal motion
    case 1: // "groundlock" the motion, so you can't walk off cliffs
        repeat (abs(force_x)) {    // each iteration of this loop should move one pixel
            if (!place_meeting(x + xs, y + 1, Solid) && place_meeting(x + xs, y + 2, Solid)) {  // if there is a slope facing downwards
                x += xs;    // move forward
                y += 1;     // and down
            } else if (!place_meeting(x + xs, y, Solid)) {  // there's not a slope below to stick to, so just go forward?
                if (!mode || place_meeting(x + xs, y + 1, Solid)) { // only if you're not groundlocked or there is ground beneath you anyway
                    x += xs;    // move forward
                } else {
                    force_x = 0;   // you've been groundlocked, exit the loop
                }
            } else if (!place_meeting(x + xs, y - 1, Solid)) {  // you couldn't move forward, can you go uphill?
                x += xs;    // forward
                y -= 1;     // and upward!
            } else {
                force_x = 0;   // there's a wall of some sort in your way, stop.
            }
        }
        break;
    case -1:    // just move, ignore all collisions
        repeat (abs(force_x)) { x += xs; };    // like so!
        break;
}
