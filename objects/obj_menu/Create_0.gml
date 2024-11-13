width = 75; // Start value, it resizes in Draw
height = 104; // Start value, it resizes in Draw

padding = 8;
gap = 16;

pos = 0;

options[0, 0] = get_dictionary_value("startMenu.start");
options[0, 1] = get_dictionary_value("startMenu.settings");
options[0, 2] = get_dictionary_value("startMenu.exit");

// Settings menu
options[1, 0] = get_dictionary_value("startMenu.fullscreen");
options[1, 1] = get_dictionary_value("startMenu.language");
options[1, 2] = get_dictionary_value("startMenu.music-volume");
options[1, 3] = get_dictionary_value("startMenu.sfx-volume");
options[1, 4] = get_dictionary_value("startMenu.back");

options_length = 0;
menu_level = 0;