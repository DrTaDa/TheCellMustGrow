event_inherited();

custom_alarm0 = noone;
custom_alarm1 = random_range(0.95, 1.05) * 20 * 60 * 60;
custom_alarm_display_info = 0;

pause = instance_create_layer(x, y, "lay_UI", obj_pause);
pause.owner = self;
pause_channel = false;

capturers = [];
triggered_alarm = false;
built_object = noone;
mass = sprite_width * sprite_width;
looking_for_membrane_slot = false;
flag_display_UI_info = false;
number_of_use = 0;

spawn_target_dist = noone;
spawn_target_angle = noone;

cell = instance_find(obj_player_cell, 0);
array_push(cell.contains_instances, self);

info_panel = instance_create_layer(0, 0, "lay_info_panels", obj_UI_display_info);
info_panel.owner = self;

function instantiate_capturer(target_type, capturer_distance, capturer_angle, capturer_range)
{
	var tmp_capturer = instance_create_layer(0, 0, "lay_capturers", obj_capturer);
	tmp_capturer.owner = self;
	tmp_capturer.relative_distance = capturer_distance;
	tmp_capturer.relative_angle = capturer_angle;
	tmp_capturer.update_position();
	tmp_capturer.target_type = target_type;
	tmp_capturer.range = capturer_range;
	tmp_capturer.remove_consumed_from_counter = true;
	array_push(self.capturers, tmp_capturer);
}

function check_trigger_alarm()
{
	if self.built_object != noone
	{
		if array_length(self.capturers) && !self.pause_channel && !self.triggered_alarm
		{
			var flag_missing_block = false;

			for(i = 0; i < array_length(self.capturers); ++i)
			{
				if instance_exists(self.capturers[i]) // WARNING: SHOULD NOT BE NEEDED
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
				self.triggered_alarm = true;
				self.custom_alarm0 = 120;
			}
		}
	}
}

function spawn_target()
{
	audio_play_sound(mixkit_game_ball_tap_2073, 10, false);

	if self.built_object == obj_block_blue || self.built_object == obj_block_green || self.built_object == obj_block_orange
	{
		var tmp_layer = "lay_blocks"
	}
	else
	{
		var tmp_layer = "lay_channels"
	}

	if self.spawn_target_dist == noone
	{
		var tmp_spawn_x = x + random_range(-20, 20);
		var tmp_spawn_y = y + random_range(-20, 20);
	}
	else
	{
		var rad_angle = pi * (self.phy_rotation + self.spawn_target_angle) / 180;
		var tmp_spawn_x = x + (self.spawn_target_dist * cos(rad_angle));
		var tmp_spawn_y = y + (self.spawn_target_dist * sin(rad_angle));
	}

	var tmp_object = instance_create_layer(
		tmp_spawn_x, tmp_spawn_y, tmp_layer, self.built_object
	);

	tmp_object.init_kick = true;
}