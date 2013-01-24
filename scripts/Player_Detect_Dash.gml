if (Input_Pressed(Input.left)) {    // If you've pressed left once
    if (dash.dir != Input.left) {   // and the previous direction tapped wasn't left
        dash.taps = 0;  // reset number of dash 'taps'
    }
    dash.dir = Input.left;  // set the dash direction to left
}
if (Input_Pressed(Input.right)) {   // If you've pressed right
    if (dash.dir != Input.right) {  // and it was left most recently
        dash.taps = 0;  // reset number of dash 'taps'
    }
    dash.dir = Input.right; // set the dash direction to right
}

if (Input.k[dash.dir] > dash.delay) {   // if you've let go of whichever button is the current dash direction for too long
    dash.taps = 0;  // reset dash 'taps'
}

switch (dash.taps) {    // how many taps did he have?
    case 0:
    case 1:
        if (Input_Released(dash.dir)) { // pressed in dash direction
            dash.taps += 1; // increment taps
        }
        break;
    case 2:
        if (Input_Pressed(dash.dir)) {  // 
            dash.taps = 0;
            State_Change(dash);
            exit;
        }
        break;
}

