event_inherited()

if !self.pause_channel
{
	self.custom_alarm3 += 1 * global.current_speed_up;
	
	if self.custom_alarm3 >= self.threshold_alarm0
	{
		self.custom_alarm3 = 0;
		tmp_x = self.x + 27. * cos((self.phy_rotation - 3) * pi / 180);
		tmp_y = self.y + 27. * sin((self.phy_rotation - 3) * pi / 180);
		tmp_x2 = self.x + 27. * cos((self.phy_rotation + 183) * pi / 180);
		tmp_y2 = self.y + 27. * sin((self.phy_rotation + 183) * pi / 180);
		
		audio_play_sound(mixkit_game_ball_tap_2073, 10, false);

		var tmp_object = instance_create_layer(tmp_x, tmp_y, "lay_channels", self.built_object);
		tmp_object.init_kick = true;
		var tmp_object = instance_create_layer(tmp_x2, tmp_y2, "lay_channels", self.built_object);
		tmp_object.init_kick = true;
	}
}