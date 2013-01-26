if (stand.age == 0) {
    jump.wallgrab = false;
}

Player_X_Input();

if (Input_Pressed(Input.jump)) { State_Change(jump); exit; };
if (vel.xprs && (!place_meeting(x + sign(vel.xmax), y, Solid) || !place_meeting(x + sign(vel.xmax), y - 1, Solid))) { State_Change(run); exit; };
if (Input_Pressed(Input.attack)) { State_Change(attack); exit; };
if (place_meeting(x, y + 1, SemiSolid) && !place_meeting(x, y + 1, Solid) && Input_Pressed(Input.down)) { y += 1; State_Change(fall); exit; };
if (!place_meeting(x, y + 1, SemiSolid) && !place_meeting(x, y + 1, Solid)) { State_Change(fall); exit; };

Player_Detect_Dash();
