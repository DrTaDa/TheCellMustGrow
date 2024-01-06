event_inherited();

if self.current_charge > self.threshold_charge
{
	self.current_charge -= self.threshold_charge;
	audio_play_sound(mixkit_game_ball_tap_2073, 10, false);

	tmp_x = self.x + 24. * cos((self.phy_rotation + 90) * pi / 180);
	tmp_y = self.y + 24. * sin((self.phy_rotation + 90) * pi / 180);
	var tmp_object = instance_create_layer(tmp_x, tmp_y, "lay_channels", obj_energy);
	tmp_object.init_kick = true;
}