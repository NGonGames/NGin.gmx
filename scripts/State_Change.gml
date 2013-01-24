
var _state, _new, _on_enter, _on_exit, _draw, _temp;

_state = argument0;
_temp = state;

if (state != _state) {
    state_next = _state;
    if (state.onExit != -1) {
        script_execute(state.onExit);
    }
    state.age = 0;
    state = _state;
    state_last = _temp;
    if (state.onEnter != -1) {
        script_execute(state.onEnter);
    }
    state.age = 0;
}
