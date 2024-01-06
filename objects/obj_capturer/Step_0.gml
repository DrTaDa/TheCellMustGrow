update_position();

if self.target_type 
{
	update_target_position();
	if self.target_sprite == noone
	{
		load_target_sprite();
	}

	if !self.owner.pause_channel && !self.owner.looking_for_membrane_slot
	{
		look_for_target();
		check_position_target();
		spend_target_duration();
	}
}

if self.owner == noone
{
	instance_destroy(self);
}
else if !instance_exists(self.owner)
{
	instance_destroy(self);
}