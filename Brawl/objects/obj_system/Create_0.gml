//RANDOMIZE SEED EVERYTIME
randomize()
display_reset(8, true) //helps with AntiAliasing

//MAIN VARIABLES
number_of_hats = 10
teams_count = 3
player_per_team_count = 1
team_lives = 25

//MUSIC
audio_stop_all();
soundtrack_no = asset_get_index("snd_sountrack_0" + string(irandom(2) + 1))
audio_play_sound(soundtrack_no, 1, true);

//EXTRA LIVES
can_spawn_extra_lives = false
time_between_extra_lives = 60 * 5 + irandom(10)
alarm[2] = 5

SpawnersGotTimeToSpawn = false
AllPlayersSpawned = false
alarm[0] = 20

player_lost_live = array_create(teams_count, true);
player_lives_array = array_create(teams_count, team_lives + 1); //2 players, 6 lives each;
player_hats = array_create(teams_count, 3)
player_jump_sounds = array_create(teams_count, 3)

initial_spawning_done = false;
//player_alive_array = array_create(6, false);


