function load_dictionary(_lang) {
	var _file_name = "";
	switch ( _lang) {
		case "it": 	_file_name = "lang_it.json" ; break;
		case "en": 	_file_name = "lang_en.json" ; break;
		default: _file_name = "lang_en.json" ; break;
	}
	var _json_file = file_text_open_read(working_directory + "\\" + _file_name);
	var _data = "";

	if (_json_file >= 0) {
		while (!file_text_eof(_json_file)) {
			_data += file_text_read_string(_json_file);
			file_text_readln(_json_file);
		}
		file_text_close(_json_file);
		
		return json_parse(_data);
	} else return {}
}

function get_dictionary_value(_key) {
	var _key_split = string_split(_key, ".");
	var _key_length = array_length(_key_split);
	var _key_root = global.language_dictionary;
	
	if (_key_length > 0) {
		for (var _i=0; _i<_key_length; _i++) {
			var _local_key = _key_split[_i];
			_key_root = struct_get(_key_root, _local_key);
			
			if is_undefined(_key_root) return _key
		}
		return _key_root;
	}
	return _key;
}