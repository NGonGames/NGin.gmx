var i;

/// TODO: !!!! Warning, this only uses keyboard_check() -- still need to add virtual keys for touch input devices
/// @NOTE: This should mostly be done in the Input Create script
if (!config_joypad) {
    for (i = 0; i < key_max; i += 1) {
        k[i] = keyboard_check(key[i]) * 2 - 1;
        keystate[i] += k[i];
        keystate[i] *= iff(sign(k[i]) == sign(keystate[i]), 1, 0);
    }
} else {
    /// TODO: Add Joypad/axis support
}
