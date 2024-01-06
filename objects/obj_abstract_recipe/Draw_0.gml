event_inherited()

if self.target_sprite != noone
{
	draw_sprite_ext(self.target_sprite,
					self.target_sprite_index,
					x, y, self.target_sprite_scale,
					self.target_sprite_scale, self.phy_rotation, c_white, 1);
}

if position_meeting(mouse_x, mouse_y, id)
{
	draw_sprite_ext(spr_delete, 0, x, y, 1, 1, 45, c_white, 0.4);
}
