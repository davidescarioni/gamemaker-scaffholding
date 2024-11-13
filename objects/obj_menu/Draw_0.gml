draw_set_font(fnt_menu)

// Dinamically get with and height of the menu
var _new_width = 0;
for (var _j=0; _j<options_length; _j++) {
	var _option_width = string_width(options[menu_level, _j]);
	_new_width = max(_new_width, _option_width);
}
width = _new_width + padding * 2;
height = padding * 2 + string_height(options[0, 0]) + (options_length - 1) * gap;

// Center menu
var _camera = view_camera[0]
x = camera_get_view_x(_camera) + camera_get_view_width(_camera) / 2 - (width/2);
y = camera_get_view_y(_camera) + camera_get_view_height(_camera) / 2 - (height/2);

// Draw background
draw_sprite_ext(sprite_index, image_index, x, y, width / sprite_width, height/sprite_height, 0, c_white, image_alpha)

// Draw options
draw_set_valign(fa_top);
draw_set_halign(fa_left);

for (var _i=0; _i<options_length; _i++) {
	var _color = c_white;
	if (pos == _i) _color = c_yellow;
	draw_text_color(x+padding, y+padding+gap*_i, options[menu_level,_i], _color, _color, _color, _color, 1)
}