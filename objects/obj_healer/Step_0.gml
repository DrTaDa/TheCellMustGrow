event_inherited();

// If full
flag_missing_block = false;

for(i = 0; i < array_length(self.capturers); ++i)
{
	if instance_exists(self.capturers[i])
	{
		if !self.capturers[i].target_on_capturer
		{
			flag_missing_block = true;
			break;
		}
	}
}

if !flag_missing_block
{
	// Look for factories
	final_target = noone;
	
	// HACK
	x += 100000;
	tmp_target = instance_nearest(self.x-100000, self.y, obj_abstract_factory);
	x -= 100000;

	if tmp_target != noone
	{
		if point_distance(self.x, self.y, tmp_target.x, tmp_target.y) < self.range_heal
		{
			if tmp_target.custom_alarm1 < (5 * 60 * 60)
			{
				final_target = tmp_target;
			}
		}
	}

	// Look for channels
	if final_target == noone
	{
		var tmp_target = instance_nearest(self.x, self.y, obj_channel);
		if tmp_target != noone
		{
			if point_distance(self.x, self.y, tmp_target.x, tmp_target.y) < self.range_heal
			{
				if tmp_target.custom_alarm1 < (5 * 60 * 60)
				{
					final_target = tmp_target;
				}
			}
		}
	}

	if final_target != noone
	{
		for(i = 0; i < array_length(self.capturers); ++i)
		{
			self.capturers[i].spend_target();
		}
		final_target.custom_alarm1 = random_range(0.95, 1.05) * 20 * 60 * 60;
		audio_play_sound(_084373_heal_36672, 10, false);
	}
}