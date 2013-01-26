if (global.player_start_x != noone && global.player_start_y != noone) {
    x = global.player_start_x;
    y = global.player_start_y;
    global.player_start_x = noone;
    global.player_start_y = noone;
}

instance_create(x, y, Camera);  // create camera object to act as the viewport for the player

    /** -- Any variable description preceded by @ is 
        modifiable for the purpose of changing game feel -- **/

motion = instance_create(0, 0, ForceAggregator);
vel = instance_create(0, 0, Force);

vel.xmax = 14;      // @maximum horizontal velocity
vel.xcap = 14;      // maximum horizontal speed
vel.xacl = 1.8;     // @horizontal acceleration
vel.xprs = false;   // whether some form of horizontal input is held down.
vel.fric = 1.1;     // @horizontal friction

vel.ymax = 15;      // @maximum falling speed
vel.yacl = 2.1;     // @gravity

Force_Attach(vel, motion);

stand = instance_create(0, 0, StateTemplate);       // represents normal, stationary resting
  stand.main = Player_Stand;                        // link Player_Stand as script for step event
  stand.sprite = instance_create(0, 0, Animation);  // create animation object to represent idling
    stand.sprite.left = sprite_index;               // left facing idle sprite ID
    stand.sprite.right = sprite_index;              // right facing idle sprite ID
  Animation_Refresh(stand.sprite);                  // set the rest of the idle animation vairables automatically
  
run = instance_create(0, 0, StateTemplate);         // represents horizontal motion along ground/hill surfaces
  run.main = Player_Run;                            // link Player_Run as script for step event
  run.sprite = instance_create(0, 0, Animation);    // create animation object to represent running
    run.sprite.left = sprite_index;                 // left facing running sprite ID
    run.sprite.right = sprite_index;                // right facing running sprite ID
  Animation_Refresh(run.sprite);                    // automatically set the rest of the running animation variables
  
jump = instance_create(0, 0, StateTemplate);        // Represents upwards vertical motion **ONLY**
  jump.main = Player_Jump;                          // link Player_jump as script to be called each frame
  jump.sprite = instance_create(0, 0, Animation);   // create an animation object to represent rising portion of jump
    jump.sprite.left = sprite_index;                // left facing jump sprite
    jump.sprite.right = sprite_index;               // right facing jump sprite
  Animation_Refresh(jump.sprite);                   // set the rest of the jump animation variables automatically
  jump.control = true;                              // flag for indicating control of jump after walljumping
  jump.wallgrab = false;                            // flag for indicating auto-walljump behavior
  jump.number = 0;                                  // number of jumps since last touched a surface
  jump.limit = 2;                                   // @maximum number of jumps
  jump.force = 23;                                  // @force of jump

fall = instance_create(0, 0, StateTemplate);        // Represents downwards vertical motion **ONLY**
  fall.main = Player_Fall;                          // link Player_Fall as script to be called each frame
  fall.sprite = instance_create(0, 0, Animation);   // create an animation object to be called each frame
    fall.sprite.left = sprite_index;                // left facing fall sprite
    fall.sprite.right = sprite_index;               // right facing fall sprite
  Animation_Refresh(fall.sprite);                   // set the rest of the fall animation variables automatically

dash = instance_create(0, 0, StateTemplate);        // Represents dashing motion
  dash.main = Player_Dash;                          // link Player_Dash script as script to be called each frame
  dash.sprite = instance_create(0, 0, Animation);   // create animation object to represent dashing
    dash.sprite.left = sprite_index;                // left facing dash sprite
    dash.sprite.right = sprite_index;               // right facing dash sprite
  Animation_Refresh(dash.sprite);                   // set the rest of the dash animation variables automatically
  dash.taps = 0;                                    // keeps track of double tapping to activate state
  dash.delay  = 8;                                  // @grace period between taps
  dash.length = 240;                                // @length of dash in px
  dash.dir = 0;                                     // direction of dash
  dash.xbegin = 0;                                  // starting x position of a dash, to measure against the 'length' property

attack = instance_create(0, 0, StateTemplate);      // Represents attacking action
recoil = instance_create(0, 0, StateTemplate);      // Represents being hurt

state = stand; state_last = stand; state_next = stand;  // state represents current state, state_last and state_next represent previous or next set state respectively
