obj_system.player_lives_array[player_no -1] += 1
audio_play_sound(snd_heart_up, 1, 0)
instance_destroy(other, true)

