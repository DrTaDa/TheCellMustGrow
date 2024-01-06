if(keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter)) || mouse_check_button_released(mb_left)
{
	audio_play_sound(click_151673, 10, false);
	room_goto(ro_main_game);
}

if keyboard_check_pressed(vk_escape)
{
	audio_play_sound(click_151673, 10, false);
	game_end();
}