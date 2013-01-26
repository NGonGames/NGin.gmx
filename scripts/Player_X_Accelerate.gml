if (vel.xprs) {
    if (abs(vel.x) < vel.xcap * (2.5 / 5)) {
        vel.x += vel.xacl * sign(vel.xmax);
    }
    vel.x += vel.xacl * sign(vel.xmax);
    if (abs(vel.x) > vel.xcap) {
        vel.x = vel.xmax;
    }
}

if (abs(vel.x) < vel.fric) {
    vel.x = 0;
} else {
    vel.x -= vel.fric * sign(vel.x);
}
