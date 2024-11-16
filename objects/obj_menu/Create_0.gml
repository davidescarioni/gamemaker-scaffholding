width = 75; // Start value, it resizes in Draw
height = 104; // Start value, it resizes in Draw

padding = 8;
gap = 16;

pos = 0;

// Start menu
function set_start_menu() {
	options[0, 0] = get_dictionary_value("startMenu.start");
	options[0, 1] = get_dictionary_value("startMenu.settings");
	options[0, 2] = get_dictionary_value("startMenu.exit");
}

// Settings menu
function set_settings_menu() {
	var _music_volume = obj_audio_manager.music_volume
	var _sfx_volume = obj_audio_manager.sfx_volume
	options[1, 0] = get_dictionary_value("startMenu.fullscreen");
	options[1, 1] = get_dictionary_value("startMenu.language");
	options[1, 2] = string(get_dictionary_value("startMenu.music-volume"), _music_volume);
	options[1, 3] = string(get_dictionary_value("startMenu.sfx-volume"), _sfx_volume);
	options[1, 4] = get_dictionary_value("startMenu.back");
}

function set_menus() {
	set_start_menu()
	set_settings_menu()
}

set_menus()

options_length = 0;
menu_level = 0;