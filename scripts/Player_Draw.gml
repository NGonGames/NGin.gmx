if (state.draw != -1) {
    script_execute(state.draw);
} else if (state.sprite != -1) {    // generic state render cow_yview[0],
    draw_sprite_ext(iff(!sign(xmax), state.sprite.left, state.sprite.right), state.sprite.index,
                    x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    // draw_set_color(c_red);
    // draw_text(view_xview[0] + 200, view_yview[0] + 50, string(jump.number) + ", " + string(state.age));
    // draw_set_color(c_black);
}
