// Test implementations
var _axis = input_axis(ACTION.MOVE_HORIZONTAL)
x += _axis * 10;

draw_text(20, 20, $"{get_dictionary_value("HUD.x-input")}: {x}");