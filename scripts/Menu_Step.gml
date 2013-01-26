if(device_mouse_check_button_pressed(0,mb_left)) {
    x = device_mouse_x(0);
    y = device_mouse_y(0);
    if(collision_point(x,y,PlayButton,false,true)) {
        room_goto(test0);    
    }
    if(collision_point(x,y,MuteButton,false,true)) {
        state = MuteButton.image_index;
        MuteButton.image_index = !state;
        audio_master_gain(!state);        
    }
    if(collision_point(x,y,CreditsButton,false,true)) {
        room_goto(credits_rm);
    }
}
