if (state.draw != -1) {
    script_execute(state.draw);
} else if (state.sprite != -1) {    // generic state render cow_yview[0],
    draw_sprite_ext(iff(!sign(vel.xmax), state.sprite.left, state.sprite.right), state.sprite.index,
                    x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
