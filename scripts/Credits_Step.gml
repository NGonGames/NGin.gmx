if(device_mouse_check_button_pressed(0, mb_left)) {
    x = device_mouse_x(0);
    y = device_mouse_y(0);
    if(collision_point(x,y,CreditsExitButton,true, false)) {
        room_goto(menu_rm);
    }
}
