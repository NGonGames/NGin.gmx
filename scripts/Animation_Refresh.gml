/// Animation_Refresh(spr, rate = 1, index = 0, start = 0)
var spr;
spr = argument[0];
with (spr) {
    if (left || right) {    // if an animation exists
        if (!left) {        // make sure left and right both have a value
            left = right;
        } else if (!right) {
            right = left;
        }
        length = sprite_get_number(left);   // re-cache values for sprite
        width = sprite_get_width(left);
        height = sprite_get_height(left);
        
        rate = length > 1;  // animated if multiple frames, otherwise not.
        index = 0;
        start = 0;    
        
        if (argument_count > 1) {   // accept multiple number of arguments to function
            rate = argument[1];
            if (argument_count > 2) {
                index = argument[2];
                if (argument_count > 3) {
                    start = argument[3];
                }
            }
        }
    } else {
        length = 0;
        index = 0;
        start = 0;
        rate = 0;
        width = 0;
        height = 0;
    }
}
