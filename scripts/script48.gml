if(device_mouse_check_button_pressed(0, mb_left)) {
    x = device_mouse_x;
    y = device_mouse_y;
    if(collision_point(x,y,CreditsExitButton,true, false)) {
        room_goto(menu_rm);
    }
}
