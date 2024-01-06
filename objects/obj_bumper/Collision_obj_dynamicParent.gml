if !self.pause_channel
{
	if other.phy_speed > 1 && !self.looking_for_membrane_slot
	{
		audio_play_sound(percussive_hit_02_02_105799, 10, false, 0.25, 0, 0.9);
		current_charge += other.phy_speed / global.current_speed_up;
	}
}