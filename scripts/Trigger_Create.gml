trigger_id = noone; // An id for this trigger. All Mechanism with a matching mechanism_id will be triggered by this trigger.
actor = Player;     // Object(s) that will activate this trigger

mode_radial = 0;        // radial detection
mode_rectangular = 1;   // rectangular detection
mode_point = 2;         // point detection
mode_spritemask = 3;    // use a sprite for detection

detection_mode = mode_point;    // point detection by default

detection_radius = 0;   // used for radial detection
detection_width = 0;    // used for rectangular detection
detection_height = 0;   // used for rectangular detection
detection_xoffset = 0;  // used for most detection(s)
detection_yoffset = 0;  // used for most detection(s)
detection_spritemask = -1;  // used for spritemask detection
