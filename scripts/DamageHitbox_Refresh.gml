if(argument_count>0) {
    owner = argument[0];
    if(argument_count>1) {
        damage = argument[1]; 
        if(argument_count>2) {
            active = argument[2];
            if(argument_count>3) {
                type = argument[3];
            }
        }
    }
}
mask_index = owner.mask_index;
