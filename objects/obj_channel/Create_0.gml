event_inherited()

joint_in = noone;
joint_out = noone;

custom_alarm1 = random_range(0.95, 1.05) * 20 * 60 * 60;
custom_alarm_display_info = 0;

traversing_molecule_id = noone;
traversing_molecule_id2 = noone;
type_obj_passing = noone;
type_obj_consumed = noone;

mass = sprite_width * sprite_width;

range_passive = 20;
range_active = 70;
range_free_space = 80;

entrance_x = 0;
entrance_y = 0;
exit_x = 0;
exit_y = 0;
flag_update_channel_positions = true;

has_capturer = false;
has_capturer2 = false;
capturer = noone;
capturer2 = noone;
dist_capturer = point_distance(36, 36, 61, 19);
angle_capturer = -34;
dist_capturer2 = point_distance(36, 36, 61, 19);
angle_capturer2 = 34;

init_kick = false;
looking_for_membrane_slot = false;

pause = instance_create_layer(x, y, "lay_UI", obj_pause);
pause.owner = self;
pause_channel = false;

flag_display_UI_info = false;
number_of_use = 0;

cell = instance_find(obj_player_cell, 0);
array_push(cell.contains_instances, self);

info_panel = instance_create_layer(0, 0, "lay_info_panels", obj_UI_display_info);
info_panel.owner = self;

on_circle_angle = noone;
on_circle_x = noone;
on_circle_y = noone;

function instantiate_capturer()
{
	if (self.has_capturer)
	{
		self.capturer = instance_create_layer(0, 0, "lay_capturers", obj_capturer);
		self.capturer.owner = self;
		self.capturer.target_type = obj_energy;
		self.capturer.relative_distance = dist_capturer;
		self.capturer.relative_angle = angle_capturer;
		self.capturer.update_position();
	}
	
	if (self.has_capturer2)
	{
		self.capturer2 = instance_create_layer(0, 0, "lay_capturers", obj_capturer);
		self.capturer2.remove_consumed_from_counter = true;
		self.capturer2.owner = self;
		self.capturer2.target_type = obj_energy;
		self.capturer2.relative_distance = dist_capturer2;
		self.capturer2.relative_angle = angle_capturer2;
		self.capturer2.update_position();
	}
}

function update_channel_positions()
{
	self.entrance_x = self.x + self.entrance_distance * cos(pi * (self.phy_rotation + self.entrance_angle) / 180);
	self.entrance_y = self.y + self.entrance_distance * sin(pi * (self.phy_rotation + self.entrance_angle) / 180);
	self.exit_x = self.x + self.exit_distance * cos(pi * (self.phy_rotation + self.exit_angle) / 180);
	self.exit_y = self.y + self.exit_distance * sin(pi * (self.phy_rotation + self.exit_angle) / 180);

	if (self.has_capturer)
	{
		self.capturer.update_position();
	}
	if (self.has_capturer2)
	{
		self.capturer2.update_position();
	}
}

function catch_block()
{
	
	look_for_target = false
	if (!instance_exists(self.traversing_molecule_id) && !instance_exists(self.traversing_molecule_id2))
	{
		look_for_target = true
	}

	if (look_for_target)
	{
		self.traversing_molecule_id = noone;
		self.traversing_molecule_id2 = noone;
		block = instance_nearest(self.entrance_x, self.entrance_y, self.type_obj_passing);
		
		var tmp_range = self.range_passive;

		if self.capturer
		{
			if self.capturer.consuming
			{
				tmp_range = self.range_active;
			}
		}
		if self.capturer2
		{
			if self.capturer2.consuming
			{
				tmp_range = self.range_active;
			}
		}

		if block != noone
		{
			if (!block.captured)
			{
				if point_distance(self.entrance_x, self.entrance_y, block.x, block.y) < tmp_range
				{
					block.captured = true;
					block.capturer_id = self.id;
					block.phy_active = false;
					block.target_x = self.entrance_x;
					block.target_y = self.entrance_y;
					self.traversing_molecule_id = block.id;
				}
			}
		}
	}
}

function resolve_first_section()
{
	if point_distance(self.entrance_x, self.entrance_y, self.traversing_molecule_id.x, self.traversing_molecule_id.y) < 5
	{
		audio_play_sound(woosh_slide_in_88642, 10, false, 0.2, 0, 0.8);
		self.traversing_molecule_id.target_x = self.exit_x;
		self.traversing_molecule_id.target_y = self.exit_y;
		self.traversing_molecule_id2 = self.traversing_molecule_id;
		self.traversing_molecule_id = noone;
	}
	else
	{
		self.traversing_molecule_id.target_x = self.entrance_x;
		self.traversing_molecule_id.target_y = self.entrance_y;
	}
}

function resolve_second_section()
{
	if point_distance(self.exit_x, self.exit_y, self.traversing_molecule_id2.x, self.traversing_molecule_id2.y) < 5
	{
		alarm[0] = 1;
	}
		else
	{
		self.traversing_molecule_id2.target_x = self.exit_x;
		self.traversing_molecule_id2.target_y = self.exit_y;
	}
}

function free_targets()
{
	if self.traversing_molecule_id != noone
	{
		if instance_exists(self.traversing_molecule_id)
		{
			self.traversing_molecule_id.captured = false;
			self.traversing_molecule_id.capturer_id = noone;
			self.traversing_molecule_id.phy_active = true;
			self.traversing_molecule_id.target_x = noone;
			self.traversing_molecule_id.target_y = noone;
			self.traversing_molecule_id = noone;
		}
	}
	if self.traversing_molecule_id2 != noone
	{
		if instance_exists(self.traversing_molecule_id2)
		{
			self.traversing_molecule_id2.captured = false;
			self.traversing_molecule_id2.capturer_id = noone;
			self.traversing_molecule_id2.phy_active = true;
			self.traversing_molecule_id2.target_x = noone;
			self.traversing_molecule_id2.target_y = noone;
			self.traversing_molecule_id2 = noone;
		}
	}
}

function check_for_free_space(){

	// Check if close to the membrane
	if point_distance(self.x, self.y, self.cell.x, self.cell.y) > (self.cell.radius - 64)
	{
		// Check if closest point on the circle is distance enough from the other channels
		var on_circle_angle = point_direction(self.cell.x, self.cell.y, self.x, self.y) + 90;
		var on_circle_x = self.cell.x + self.cell.radius * sin(on_circle_angle * pi / 180);
		var on_circle_y = self.cell.y + self.cell.radius * cos(on_circle_angle * pi / 180);

		if self.cell.is_space_on_membrane(on_circle_x, on_circle_y)
		{
			// Instantiate the channel
			var tmp_channel = instance_create_layer(on_circle_x, on_circle_y, "lay_channels", self.built_object);
			tmp_channel.phy_angular_velocity = 0;
			tmp_channel.phy_position_x = on_circle_x;
			tmp_channel.phy_position_y = on_circle_y;
			tmp_channel.phy_speed_x = 0.;
			tmp_channel.phy_speed_y = 0.;
			tmp_channel.phy_rotation = 180 + 360 - on_circle_angle;	
			array_push(self.cell.membrane_channels, tmp_channel);

			instance_destroy(self);
		}
	}
}
