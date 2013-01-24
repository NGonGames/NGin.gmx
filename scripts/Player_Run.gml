if (state.age == 0) {
};

Player_X_Input();
Player_X_Accelerate(); 
Move_X(iff(xprs, 0, 1));

if (Input_Pressed(Input.jump)) {
    State_Change(jump);
    exit;
};

if ((xspd == 0) && (!xprs || place_meeting(x + sign(xmax), y, Solid))) {
    State_Change(stand);
    exit;
};

if (!place_meeting(x, y + 1, Solid) && (place_meeting(x, y, SemiSolid) || !place_meeting(x, y + 1, SemiSolid))) {
    State_Change(fall);
    exit;
};

if (Input_Pressed(Input.attack)) {
    State_Change(attack);
    exit;
};

Player_Detect_Dash();
