/**
 * @function input_setup
 * @description Setup the input manager.
 * @param {array} _bindings The bindings for the input manager.
 * @param {array} _axes The axes for the input manager.
 */
function input_setup(_bindings, _axes) {
    global.input_manager_bindings = {};
    global.input_manager_axes = {};
    global.input_manager_type = "keyboard";
    for (var _i = 0; _i < array_length(_bindings); _i++) {
        var _binding = variable_clone(_bindings[_i])
        global.input_manager_bindings[$ _binding.id] = _binding;
    }
    
    for (var _i = 0; _i < array_length(_axes); _i++) {
        var _axis = variable_clone(_axes[_i]);
        global.input_manager_axes[$ _axis.id] = _axis;
    }
}

/**
 * @function input_get_current_type
 * @description Get the current input manager type (keyboard or gamepad).
 * @returns {string} The current input manager type.
 */
function input_get_current_type() {
    return global.input_manager_type;
}

/**
 * @function input_update
 * @description Update the input manager.
 */
function input_update() {
    if (keyboard_check_pressed(vk_anykey) || mouse_check_button_pressed(mb_any)) {
        global.input_manager_type = "keyboard";
    } else if (gamepad_is_connected(0) ) {
        var _num_gamepads = gamepad_get_device_count();
        for (var _gamepad_id = 0; _gamepad_id < _num_gamepads; _gamepad_id++) {
            if gamepad_is_connected(_gamepad_id) {
                var _num_buttons = gamepad_button_count(_gamepad_id);
                for (var _i = 0; _i < _num_buttons; _i++) {
                    if (gamepad_button_check_pressed(_gamepad_id, _i)) {
                        global.input_manager_type = "gamepad";
                    }
                }
            }
        }
    } 
}


/**
 * @function input_check_pressed
 * @description Check if an input was pressed.
 * @param {string} _id The id of the input to check.
 */
function input_check_pressed(_id) {
    var _pressed = false;
    var _binding = global.input_manager_bindings[$ _id];
    if (!is_undefined(_binding)) {
        var _keyboard = _binding[$ "keyboard"];
        var _gamepad = _binding[$ "gamepad"];
        var _gamepad_id = _binding[$ "gamepad_id"];
        if (is_undefined(_gamepad_id))
            _gamepad_id = 0;
        var _mouse = _binding[$ "mouse"];
        if (!is_undefined(_keyboard)) {
            for (var _i = 0; _i < array_length(_keyboard); _i++) {
                _pressed |= keyboard_check_pressed(_keyboard[_i]);
            }
        }

        if (!is_undefined(_gamepad)) {
            for (var _i = 0; _i < array_length(_gamepad); _i++) {
                _pressed |= gamepad_button_check_pressed(_gamepad_id, _gamepad[_i]);
            }
        }

        if (!is_undefined(_mouse)) {
            for (var _i = 0; _i < array_length(_mouse); _i++) {
                _pressed |= mouse_check_button_pressed(_mouse[_i]);
            }
        }
    }
    return _pressed;
}

/**
 * @function input_check
 * @description Check if an input is being held.
 * @param {string} _id The _id of the input to check.
 */
function input_check(_id) {
    var _held = false;
    var _binding = global.input_manager_bindings[$ _id];
    if (!is_undefined(_binding)) {
        var _keyboard = _binding[$ "keyboard"];
        var _gamepad = _binding[$ "gamepad"];
        var _gamepad_id = _binding[$ "gamepad_id"];
        if (is_undefined(_gamepad_id))
            _gamepad_id = 0;
        var _mouse = _binding[$ "mouse"];
        if (!is_undefined(_keyboard)) {
            for (var _i = 0; _i < array_length(_keyboard); _i++) {
                _held |= keyboard_check(_keyboard[_i]);
            }
        }

        if (!is_undefined(_gamepad)) {
            for (var _i = 0; _i < array_length(_gamepad); _i++) {
                _held |= gamepad_button_check(_gamepad_id, _gamepad[_i]);
            }
        }

        if (!is_undefined(_mouse)) {
            for (var _i = 0; _i < array_length(_mouse); _i++) {
                _held |= mouse_check_button(_mouse[_i]);
            }
        }
    }
    return held;
}

/**
 * @function input_check_released
 * @description Check if an input was released.
 * @param {string} _id The id of the input to check
 */
 
function input_check_released(_id) {
    var _released = false;
    var _binding = global.input_manager_bindings[$ _id];
    if (!is_undefined(_binding)) {
        var _keyboard = _binding[$ "keyboard"];
        var _gamepad = _binding[$ "gamepad"];
        var _gamepad_id = _binding[$ "gamepad_id"];
        if (is_undefined(_gamepad_id))
            _gamepad_id = 0;
        var _mouse = _binding[$ "mouse"];
        if (!is_undefined(_keyboard)) {
            for (var _i = 0; _i < array_length(_keyboard); _i++) {
                _released |= keyboard_check_released(_keyboard[_i]);
            }
        }

        if (!is_undefined(_gamepad)) {
            for (var _i = 0; _i < array_length(_gamepad); _i++) {
                _released |= gamepad_button_check_released(_gamepad_id, _gamepad[_i]);
            }
        }

        if (!is_undefined(_mouse)) {
            for (var _i = 0; _i < array_length(_mouse); _i++) {
                _released |= mouse_check_button_released(_mouse[_i]);
            }
        }
    }
    return _released;
}


/**
 * @function input_axis
 * @description Get the value of an axis.
 * @param {string} _id The id of the axis.
 */
function input_axis(_id) {
    var _axis_value = 0;
    var _axes = global.input_manager_axes[$ _id];
    if (!is_undefined(_axes)) {
        var _keyboard = _axes[$ "keyboard"];
        var _gamepad = _axes[$ "gamepad"];
        var _gamepad_id = _axes[$ "gamepad_id"];
        var _gamepad_axis = _axes[$ "gamepad_axis"];
        if (is_undefined(_gamepad_id))
            _gamepad_id = 0;
        if (!is_undefined(_keyboard)) {
            var _negative = _keyboard[$ "negative"];
            for (var _i = 0; _i < array_length(_negative); _i++) {
                _axis_value -= keyboard_check(_negative[_i]);
            }
            var _positive = _keyboard[$ "positive"];
            for (var _i = 0; _i < array_length(_positive); _i++) {
                _axis_value += keyboard_check(_positive[_i]);
            }
        }

        if (!is_undefined(_gamepad)) {
            var _negative = _gamepad[$ "negative"];
            for (var _i = 0; _i < array_length(_negative); _i++) {
                _axis_value -= gamepad_button_check(_gamepad_id, _negative[_i]);
            }
            var _positive = _gamepad[$ "positive"];
            for (var _i = 0; _i < array_length(_positive); _i++) {
                _axis_value += gamepad_button_check(_gamepad_id, _positive[_i]);
            }
        }

        if (!is_undefined(_gamepad_axis)) {
            _axis_value += gamepad_axis_value(_gamepad_id, _gamepad_axis);
        }
    }
    return clamp(_axis_value, -1, 1);
}