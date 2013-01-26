if (state.age == 0) {
    jump.wallgrab = false;
    jump.control = true;    // return horitontal control in the event of coming from a walljump
}

if (Input_Pressed(Input.jump) && (place_meeting(x + 1, y, Solid) || place_meeting(x - 1, y, Solid))) {  // trying to walljump?
    jump.number -= 1;   // negate jump counter incrementing so you're not penalized for walljumping
    vel.x = vel.xcap * iff(place_meeting(x + 1, y, Solid), -1, 1);   // start moving away from the wall
    vel.xmax = vel.xcap * sign(vel.x);   // set direction variable in most paranoid way possible
    State_Change(jump); // start jumping!
    jump.control = false;   // you've wall jumped, no soup for you. (momentary grace peroid for switching directionality of input)
    exit;
}

Player_X_Input();   // detect and handle player input
Player_X_Accelerate();  // handle motion based on current input status

Move_X(motion);   // move horiztonally

vel.y += vel.yacl;   // gravity

Move_Y(motion);   // fall

if (place_meeting(x, y + 1, Solid) || (place_meeting(x, y + 1, SemiSolid) && !place_meeting(x, y, SemiSolid))) {    // found ground to land on
    if (vel.x != 0) { State_Change(run); } else { State_Change(stand); } // either stand or run, based on whether you were moving the moment you hit the ground
    jump.number = 0;    // reset jumps
    exit;
}

if (Input_Pressed(Input.jump) && jump.number < jump.limit) {    // standard air jump
    State_Change(jump);
    exit;
}

if (Input_Pressed(Input.attack)) { // standard aerial strike
    State_Change(attack);
    exit;
}

Player_Detect_Dash();
