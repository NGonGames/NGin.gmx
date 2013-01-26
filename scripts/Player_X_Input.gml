var press, release;

press = false;
release = false;

if (Input_Pressed(Input.left)) {
    vel.xmax = -vel.xcap;
    press = true;
}

if (Input_Pressed(Input.right)) {
    vel.xmax = vel.xcap;
    press = false;
}

if (Input_Released(Input.left) && Input_Down(Input.right)) {
    vel.xmax = vel.xcap;
    release = true;
}

if (Input_Released(Input.right) && Input_Down(Input.left)) {
    vel.xmax = -vel.xcap;
    release = true;
}

if (Input_Down(Input.left) || Input_Down(Input.right)) {
    vel.xprs = true;
} else {
    vel.xprs = false;
}

if (!press && !release && vel.xprs) {
    if (Input_Down(Input.left)) {
        vel.xmax = -vel.xcap;
    } else if (Input_Down(Input.right)) {
        vel.xmax = vel.xcap;
    }
}
