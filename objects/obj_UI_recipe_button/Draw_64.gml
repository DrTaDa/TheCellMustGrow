
if self.locked && self.unlock_price <= cell.n_research_in_cell
{
	var _size = 0.9 + 0.1 * (1 + sin(current_time / 200));
	var _rotation = 0 + 10 * sin(current_time / 351);
	draw_sprite_ext(sprite_index, 0, x, y, _size, _size, _rotation, make_colour_rgb(180, 180, 180), 1);
}
else
{
	draw_self();
}

if self.target_sprite != noone
{
	if (cell.n_research_in_cell == 0 || self.locked)
	{
		draw_set_alpha(0.8);
	}
	draw_sprite(self.target_sprite, self.target_sprite_index, x, y);

	for (var i = 0; i < array_length(self.cost_sprites); ++i;)
	{
		draw_sprite_ext(self.cost_sprites[i], 1, x - 34 + (11 * i), y - 50, 0.45, 0.45, 0, c_white, 1);
	}

	draw_set_alpha(1);
}

if self.locked
{
	draw_sprite_ext(spr_lock, 0, x - 26, y - 38, 0.8, 0.8, 0, c_white, 1);
	draw_set_colour(c_white);
	draw_text_sharp(
		x - 23,
		y,
		string(self.unlock_price),
		26
	);
}
