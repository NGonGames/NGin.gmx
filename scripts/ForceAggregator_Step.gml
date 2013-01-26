for (var i = 0; i < ds_list_size(force_list); ++i) {
    var tempForce = ds_list_find_value(force_list, i);
    if(tempForce.impulse) {
        tempForce.x = tempForce.x * decay;
        tempForce.y = tempForce.y * decay;    
    }
}
