var trigger_flag;
trigger_flag = false;
if (detection_mode == mode_point) {
    if (collision_point(x + detection_xoffset, y + detection_yoffset, actor, true, false)) {
        trigger_flag = true;
    }
} else if (detection_mode == mode_radial) {
    if (collision_circle(x, y, detection_radius, actor, true, false)) {
        trigger_flag = true;
    }
} else if (detection_mode == mode_rectangular) {
    if (collision_rectangle(x - detection_width / 2, y - detection_height / 2,
                            x + detection_width / 2, y + detection_height / 2,
                            actor, true, false)) {
        trigger_flag = true;
    }
} else if (detection_mode == mode_spritemask) {
    mask_index = detection_spritemask;
    if (place_meeting(x + detection_xoffset, y + detection_yoffset, actor)) {
        trigger_flag = true;
    }
    mask_index = -1;
}

if (trigger_flag) {
    with (Mechanism) {
        /// @TODO: add cooldowns (and more?). 
        if (mechanism_id == other.trigger_id && mechanism_id != noone) {
            start = true;
        }
    }
}
