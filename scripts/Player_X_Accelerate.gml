if (xprs) {
    if (abs(xspd) < xcap * (2.5 / 5)) {
        xspd += xacl * sign(xmax);
    }
    xspd += xacl * sign(xmax);
    if (abs(xspd) > xcap) {
        xspd = xmax;
    }
}

if (abs(xspd) < xfrc) {
    xspd = 0;
} else {
    xspd -= xfrc * sign(xspd);
}
