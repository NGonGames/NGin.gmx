var current_state;
current_state = state;
if (state.main != -1) {
    script_execute(state.main);
}
if (current_state == state) {
    state.age += 1;
}

if (state.sprite) {
    Animation_Update(state.sprite);
}
