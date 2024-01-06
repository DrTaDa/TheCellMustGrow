if self.owner != noone
{
	if instance_exists(self.owner)
	{
		if self.owner.pause_channel
		{
			draw_sprite_ext(spr_delete, 0, x, y, 1, 1, 45, c_white, 1);
		}
		else if position_meeting(mouse_x, mouse_y, self.owner.id)
		{
			draw_sprite_ext(spr_delete, 0, x, y, 1, 1, 45, c_white, 0.5);
		}
	}
}