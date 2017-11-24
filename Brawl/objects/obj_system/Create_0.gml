//RANDOMIZE SEED EVERYTIME
randomize()

//number of available hats
number_of_hats = 10

display_reset(8, true)
teams_count = 4;
player_per_team_count = 2;
team_lives = 6

player_lost_live = array_create(teams_count, true);
player_lives_array = array_create(teams_count, team_lives + 1); //2 players, 6 lives each;
player_hats = array_create(teams_count, 0)
initial_spawning_done = false;
//player_alive_array = array_create(6, false);


