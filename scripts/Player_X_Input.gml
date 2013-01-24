var press, release;

press = false;
release = false;

if (Input_Pressed(Input.left)) {
    xmax = -xcap;
    press = true;
}

if (Input_Pressed(Input.right)) {
    xmax = xcap;
    press = false;
}

if (Input_Released(Input.left) && Input_Down(Input.right)) {
    xmax = xcap;
    release = true;
}

if (Input_Released(Input.right) && Input_Down(Input.left)) {
    xmax = -xcap;
    release = true;
}

if (Input_Down(Input.left) || Input_Down(Input.right)) {
    xprs = true;
} else {
    xprs = false;
}

if (!press && !release && xprs) {
    if (Input_Down(Input.left)) {
        xmax = -xcap;
    } else if (Input_Down(Input.right)) {
        xmax = xcap;
    }
}
