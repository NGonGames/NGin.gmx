
if (abs(Player.vel.x) > Player.vel.xcap / 2) {
    time[0] += 1;
} else {
    time[0] = 0;
}

goal_x = Player.x + (width * .4) * sign(Player.vel.xmax) * min(1, (abs(Player.vel.x) / Player.vel.xcap) * min((time[0] / 45), 1));
goal_y = Player.y - 30 + (height * .2) * max(0, Player.vel.y / Player.vel.ymax);

goal_x = min(max(goal_x, width / 2), room_width - width / 2);
goal_y = min(max(goal_y, height / 2), room_height - height / 2);

var d;
d = point_distance(x, y, goal_x, goal_y);

if (abs(x - goal_x) > (width * .6)) {
    dx -= (dx - goal_x) / (xfac / 3);
} else {
    dx -= (dx - goal_x) / xfac;
}
if (abs(y - goal_y) > (height * .3)) {
    dy -= (dy - goal_y) / (yfac / 3);
} else {
    dy -= (dy - goal_y) / yfac;
}

y -= (y - dy) / (yfac);
x -= (x - dx) / (xfac / 2);

background_x[0] = view_xview[0] * .9;
background_y[0] = view_yview[0] * .7;
