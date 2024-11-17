// Store number of options in current menu
options_length = array_length(options[menu_level])

if (input_check_released(ACTION.UP)) {
	pos-=1;
	if (pos >= 0) audio_play_sound(snd_menu_move, 1, false)
}

if (input_check_released(ACTION.DOWN)) {
	pos+=1;
	if (pos <= options_length - 1) audio_play_sound(snd_menu_move, 1, false)
}

pos = clamp(pos, 0, options_length-1)


if (input_check_pressed(ACTION.CONFIRM)) {
	
	var _start_menu_level = menu_level
	
	switch (menu_level) {
		case 0:
			switch (pos) {
				case 0:
					room_goto_next();
					audio_play_sound(snd_menu_ok, 1, false)
					break;
				case 1:
					menu_level = 1;
					audio_play_sound(snd_menu_ok, 1, false)
					break;
				case 2:
					game_end()
					break;
			}
		break;
		
		case 1:
			switch (pos) {
				case 0:
					window_set_fullscreen(!window_get_fullscreen())
					audio_play_sound(snd_menu_ok, 1, false)
					break;
				case 1:
					obj_i18n_manager.switch_language(global.language)
					audio_play_sound(snd_menu_ok, 1, false)
					
					// Need to re-set language menu when we change language
					set_menus();
					break;
				case 2:
					with (obj_audio_manager) set_music_volume(+.1)
					audio_play_sound(snd_menu_ok, 1, false)
					set_settings_menu()
					break;
				case 3:
					with (obj_audio_manager) set_sfx_volume(+.1)
					audio_play_sound(snd_menu_ok, 1, false)
					set_settings_menu()
					break;
				case 4:
					menu_level = 0;
					audio_play_sound(snd_menu_back, 1, false)
					break;
			}
		break;
	}
	
	// Set position to 0 when change the menu
	if (_start_menu_level != menu_level) pos = 0;
	
	// Store number of options in current menu to avoid breaking the draw event
	options_length = array_length(options[menu_level])
}