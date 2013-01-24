if (state.age == 0) {
    yspd = -jump.force;
    jump.number += 1;
    jump.wallgrab = false;
}

/// TODO: Fix wall jumping so that you need to be pressing towards the wall to initiate the first jump

if (jump.control) {
    Player_X_Input();
    Player_X_Accelerate();
} else if (place_meeting(x + xspd, y, Solid)) {
    repeat(abs(xspd)) {
        if (!place_meeting(x + sign(xspd), y, Solid)) {
            x += sign(xspd);
        }
    }
    jump.control = true;
    jump.wallgrab = true;
}

if (Input_Pressed(Input.jump) && (xprs || jump.wallgrab) && (place_meeting(x + 1, y, Solid) || place_meeting(x - 1, y, Solid))) {
    jump.number -= 1;   // negate jump counter incrementing so you're not penalized for walljumping
    xspd = xcap * iff(place_meeting(x + 1, y, Solid), -1, 1);   // start moving away from the wall
    xmax = xcap * sign(xspd);   // set direction variable in most paranoid way possible
    State_Change(jump); // start jumping!
    jump.control = false;   // you've wall jumped, no soup for you. (momentary grace peroid for switching directionality of input)
    exit;
}

Move_X();

yspd += yacl;

if (!Input_Down(Input.jump) && jump.control) {
    yspd += yacl;
}

Move_Y();

if (yspd >= 0) {
    State_Change(fall);
}
if (Input_Pressed(Input.jump) && jump.control && jump.number < jump.limit) { State_Change(jump); exit; }
if (Input_Pressed(Input.attack)) { State_Change(attack); exit; }

if (jump.control) {
    Player_Detect_Dash();
}
