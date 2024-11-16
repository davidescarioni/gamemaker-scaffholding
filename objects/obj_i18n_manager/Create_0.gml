global.language = os_get_language();
global.language_dictionary = load_dictionary(global.language)

function set_language_string(_lang) {
	global.language_dictionary = load_dictionary(_lang)
}

function switch_language(_lang) {
	show_debug_message(_lang)
	if (_lang == "it") global.language = "eng";
	else global.language = "it";
	
	set_language_string(global.language)
}