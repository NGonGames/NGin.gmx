
var ys;

ys = vel.y;

repeat (abs(ys)) {
    if (!place_meeting(x, y + sign(ys), Solid)) {
        if ((place_meeting(x, y, SemiSolid) || !place_meeting(x, y + 1, SemiSolid)) || ys < 0) {
            y += sign(ys);
        } else {
            if (object_index == Player) {
                vel.y = 0;
            }
        }
    } else {
        if (object_index == Player) {
            vel.y = 0;
        }
    }
}
