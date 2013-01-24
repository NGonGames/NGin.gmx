var is_desktop_os;  // shorthand variable for detecting what platform we're on
is_desktop_os = os_type == os_win32 || os_type == os_macosx || os_type == os_linux;
config_none = 0;    // constants representing platform configurations
config_mobile = 1;
config_native = 2;
config_web = 3;
config_mobile_web = 4;

config = config_none;   // variable (effectively a constant after determination) representation of platform
config_joypad = false;      // boolean for whether there is a 

if (os_browser == browser_not_a_browser) {  // we're running in some sort of executable form
    if (is_desktop_os) {
        config = config_native; // this mostly will mean we're using keyboard/mouse
    } else {
        config = config_mobile; // touch/virtual keys
    }
} else {
    if (is_desktop_os) {
        config = config_web;    // we're in a browser, and we want keyboard/mouse
    } else {
        config = config_mobile_web; // also in a browser, but need virtual keys
    }
}

left         =   0; // numerical constants for abtracting into game controls
right        =   1; // " + movement
down         =   2; // movement
up           =   3; // movement
jump         =   4; // vertically ascend!
attack       =   5; // violence, we've got it!
interact     =   6; // doors, dialog, plot coupons, you name it!
menu         =   7; // typical pause menu
quit         =   8; // button for closing the application on native platforms

key_max = 9;

key[left]    =   vk_left;   // these will be mapped to either their hardware equivalents
key[right]   =   vk_right;  // or virtual keys on mobile platforms
key[down]    =   vk_down;   // or even buttons on a joypad/controller!
key[up]      =   vk_up;     
key[jump]    =   vk_space;
key[attack]  =   ord('Z');
key[interact]=   ord('X');
key[menu]    =   vk_enter;
key[quit]    =   vk_escape;

var i;
for (i = 0; i < key_max; i += 1) {  // creates arrys for input tracking
    keystate[i] = 0;    // age of key event
    k[i] = 0;   // whether key is up [1] or down [-1]
}

if (config == config_mobile || config == config_mobile_web) { 
    /// TODO: Add virtual keys
}
