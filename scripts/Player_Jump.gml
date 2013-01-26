if (state.age == 0) {
    vel.y = -jump.force;
    jump.number += 1;
    jump.wallgrab = false;
}

/// TODO: Fix wall jumping so that you need to be pressing towards the wall to initiate the first jump

if (jump.control) {
    Player_X_Input();
    Player_X_Accelerate();
} else if (place_meeting(x + vel.x, y, Solid)) {
    repeat(abs(spd.x)) {
        if (!place_meeting(x + sign(vel.x), y, Solid)) {
            x += sign(vel.x);
        }
    }
    jump.control = true;
    jump.wallgrab = true;
}

if (Input_Pressed(Input.jump) && (vel.xprs || jump.wallgrab) && (place_meeting(x + 1, y, Solid) || place_meeting(x - 1, y, Solid))) {
    jump.number -= 1;   // negate jump counter incrementing so you're not penalized for walljumping
    vel.x = vel.xcap * iff(place_meeting(x + 1, y, Solid), -1, 1);   // start moving away from the wall
    vel.xmax = vel.xcap * sign(vel.x);   // set direction variable in most paranoid way possible
    State_Change(jump); // start jumping!
    jump.control = false;   // you've wall jumped, no soup for you. (momentary grace peroid for switching directionality of input)
    exit;
}

Move_X(motion);

vel.y += vel.yacl;

if (!Input_Down(Input.jump) && jump.control) {
    vel.y += vel.yacl;
}

Move_Y(motion);

if (vel.y >= 0) {
    State_Change(fall);
}
if (Input_Pressed(Input.jump) && jump.control && jump.number < jump.limit) { State_Change(jump); exit; }
if (Input_Pressed(Input.attack)) { State_Change(attack); exit; }

if (jump.control) {
    Player_Detect_Dash();
}
