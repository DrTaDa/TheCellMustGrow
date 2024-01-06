if !self.flag_gameover
{
	self.time_alive += global.current_speed_up * delta_time;

	self.compute_density();

	if self.flag_extend_ring
	{
		extend_membrane();
	}

	if self.flag_decaying
	{
		decay_membrane();
	}
}

if self.alarm_2 > 0
{
	self.alarm_2 -= global.current_speed_up * 1;
}
else if self.alarm_2 <= 0
{
	self.flag_decaying = true;
}