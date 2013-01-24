repeat (abs(yspd)) {
    if (!place_meeting(x, y + sign(yspd), Solid)) {
        if ((place_meeting(x, y, SemiSolid) || !place_meeting(x, y + 1, SemiSolid)) || yspd < 0) {
            y += sign(yspd);
        } else {
            yspd = 0;
        }
    } else {
        yspd = 0;
    }
}
