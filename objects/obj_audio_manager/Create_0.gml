// Load audio group
audio_group_load(ag_sfx)
audio_group_load(ag_music)

// Set volume
sfx_volume = .8;
music_volume = .6

audio_group_set_gain(ag_sfx, sfx_volume, 0);
audio_group_set_gain(ag_music, music_volume, 0);