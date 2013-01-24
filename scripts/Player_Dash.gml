if (state.age == 0) {
    dash.xbegin = x;
}

if (dash.dir == Input.right) {
    xspd = xcap;
    xmax = xcap;
} else {
    xspd = xcap * -1;
    xmax = xspd;
}

var new, goal;
new = x + xspd;
goal = dash.xbegin + dash.length * sign(xmax);
if (xspd) {
    if (new > goal) {
        xspd = new - goal;
    }
} else {
    if (new < goal) {
        xspd = new - goal;
    }
}

Move_X();

if (abs(xspd) != xcap) {
    State_Change(run);
}
