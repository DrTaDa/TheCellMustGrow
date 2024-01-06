draw_self();

if self.target_sprite != noone
{
	// Change alpha depending if it is captured or not
	if self.target_on_capturer
	{
		if self.duration_use
		{
			var alpha_factor = 1 - (self.current_duration_use / self.duration_use);
			alpha_factor = 0.3 + (0.7 * alpha_factor);
			draw_set_alpha(alpha_factor);
		}
		else
		{
			draw_set_alpha(1);
		}
	}
	else
	{
		draw_set_alpha(0.5);
	}

	//Display it at capturer position
	draw_sprite(self.target_sprite, 0, x, y);
	draw_set_alpha(1);
}