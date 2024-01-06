if !self.flag_game_loaded
{
	draw_set_colour(c_black); 
	draw_text_sharp(450, 150, "Creating the world ...", 60)
}
else
{
	if self.flag_gameover
	{
		draw_set_colour(c_black); 
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_text_sharp(960, 300, "Game over !", 60)
		draw_text_sharp(960, 400, "You stayed alive for " + string_format(cell.time_alive / 1000000, 5, 0) + " seconds", 60)
	}
	else
	{
		draw_set_alpha(0.5 * (1 + sin(current_time / 200)));
		if cell.density > 85
		{
			draw_set_colour(c_red);
			draw_set_halign(fa_center);
			draw_text_sharp(960, 150, "WARNING: CRITICAL DENSITY !", 60)
		}
		else if cell.density > 65
		{
			draw_set_colour($00A5FF);
			draw_set_halign(fa_center);
			draw_text_sharp(960, 150, "Warning: high density !", 40)
		}
		draw_set_alpha(1);

		if !global.first_recipe_clicked
		{
			if cell.n_research_in_cell
			{
				draw_sprite_ext(spr_large_arrow, 0, 1380, 25, 1, 1, 0, c_white, 0.5 * (1 + sin(current_time / 150)));
			}
		}
	}

	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}