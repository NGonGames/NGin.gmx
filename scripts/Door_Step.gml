if (place_meeting(x, y, Player)) {
    if (Input_Pressed(Input.interact) || auto) {
        if (rm != noone && rx != noone && ry != noone) {
            global.player_start_x = rx;
            global.player_start_y = ry;
            room_goto(rm);
        }
    }
}
