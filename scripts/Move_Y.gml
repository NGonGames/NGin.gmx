
var ys, agg;

if (argument_count == 0) {
    show_error("Don't call Move_Y with no arguments!", true);
} else if (argument_count == 1) {
    agg = argument[0];
} else {
    show_error("Too many arguments give to Move_Y!", true);
}

ys = ForceAggregator_Add_Y(agg);

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
