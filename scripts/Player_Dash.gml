if (state.age == 0) {
    dash.xbegin = x;
}

if (dash.dir == Input.right) {
    vel.x = vel.xcap;
    vel.xmax = vel.xcap;
} else {
    vel.x = vel.xcap * -1;
    vel.xmax = vel.x;
}

var new, goal;
new = x + vel.x;
goal = dash.xbegin + dash.length * sign(vel.xmax);
if (vel.x) {
    if (new > goal) {
        vel.x = new - goal;
    }
} else {
    if (new < goal) {
        vel.x = new - goal;
    }
}

Move_X(motion);

if (abs(vel.x) != vel.xcap) {
    State_Change(run);
}
