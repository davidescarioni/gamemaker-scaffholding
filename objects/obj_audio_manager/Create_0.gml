// Load audio group
audio_group_load(ag_sfx)
audio_group_load(ag_music)

// Set volume
sfx_volume = .1;
music_volume = .6

audio_group_set_gain(ag_sfx, sfx_volume, 0);
audio_group_set_gain(ag_music, music_volume, 0);

function set_sfx_volume(_volume) {
	var _sfx = sfx_volume
	_sfx+=_volume
	_sfx = clamp(_sfx, 0, 1)
	audio_group_set_gain(ag_sfx, _sfx, 0);
	sfx_volume = _sfx;
}

function set_music_volume(_volume) {
	music_volume+=_volume
	music_volume = clamp(music_volume, 0, 1)
	audio_group_set_gain(ag_music, music_volume, 0);
}