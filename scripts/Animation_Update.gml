var spr;
spr = argument[0];

spr.index += spr.rate;
if (spr.rate > 0) {
    if (spr.index >= spr.length) {
        spr.index -= spr.length;
    }
} else {
    if (spr.index < 0) {
        spr.index += spr.length;
    }
}
