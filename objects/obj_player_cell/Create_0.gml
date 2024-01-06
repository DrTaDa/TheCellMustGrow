self.n_blocks_in_membrane = 50;
self.max_blocks_in_membrane = self.n_blocks_in_membrane;


self.block_radius = 13;

self.membrane_clearance_radius = 90;
self.minimum_clearance_radius = 75;

self.grabbed_item = noone;
self.radius = noone;

self.blocks = [];
self.membrane_channels = [];
self.contains_instances = [];

self.n_research_in_cell = 0;
self.n_block_blue = 0;
self.n_block_green = 0;
self.n_block_orange = 0;
self.n_block_waste = 0;
self.n_block_energy = 0;
self.n_recipes = 0;

self.density = 0;
self.time_alive = 0;

self.flag_gameover = false;
self.flag_extend_ring = false;
self.flag_decaying = false;

alarm[0] = 30;
self.alarm_2 = 5 * 60 * 60; // beginning of the decay

self.x = room_width / 2
self.y = room_height / 2

self.cell_speed_x = 5;
self.cell_speed_y = 5;

function spawn_membrane()
{
	self.blocks = []
	self.radius = (self.n_blocks_in_membrane * self.block_radius / pi) - self.block_radius;

	increment = 360. / self.n_blocks_in_membrane;
	for (var i = 0; i < 360; i += increment)
	{
		block_x = self.x + self.radius * sin(i * pi / 180);
		block_y = self.y + self.radius * cos(i * pi / 180);
		new_block = instance_create_layer(block_x, block_y, "lay_membrane", obj_block_membrane);
		array_push(self.blocks, new_block);
	}

	if self.n_blocks_in_membrane > self.max_blocks_in_membrane
	{
		self.max_blocks_in_membrane = self.n_blocks_in_membrane;
	}
}

function spawn_increase_membrane()
{
	self.radius = (self.n_blocks_in_membrane * self.block_radius / pi) - self.block_radius;
	increment = (2 * pi) / self.n_blocks_in_membrane;
	
	// Add new block in the membrane
	var tmp_x = self.x + self.radius * sin(0);
	var tmp_y = self.y + self.radius * cos(0);
	var new_block = instance_create_layer(tmp_x, tmp_y, "lay_membrane", obj_block_membrane);
	array_push(self.blocks, new_block);

	// Update the positions of the blocks
	current_angle = 0;
	for (var i = 0; i < array_length(self.blocks); ++i)
	{
		self.blocks[i].target_x = self.x + self.radius * sin(current_angle);
		self.blocks[i].target_y = self.y + self.radius * cos(current_angle);
		current_angle += increment;
	}

	if self.n_blocks_in_membrane > self.max_blocks_in_membrane
	{
		self.max_blocks_in_membrane = self.n_blocks_in_membrane;
	}
}

function spawn_decrease_membrane()
{
	self.radius = (self.n_blocks_in_membrane * self.block_radius / pi) - self.block_radius;
	increment = (2 * pi) / self.n_blocks_in_membrane;
	
	// Remove block in the membrane
	instance_destroy(self.blocks[array_length(self.blocks) - 1]);
	array_delete(self.blocks, -1, 1);

	// Update the positions of the blocks
	current_angle = 0;
	for (var i = 0; i < array_length(self.blocks); ++i)
	{
		self.blocks[i].target_x = self.x + self.radius * sin(current_angle);
		self.blocks[i].target_y = self.y + self.radius * cos(current_angle);
		current_angle += increment;
	}
}

function is_space_on_membrane(tmp_x, tmp_y)
{
	for(var i = 0; i < array_length(self.membrane_channels); ++i)
	{
		if instance_exists(self.membrane_channels[i])
		{
			var distance = point_distance(tmp_x, tmp_y, self.membrane_channels[i].x, self.membrane_channels[i].y);
			if distance < self.membrane_clearance_radius
			{
				return false;
			}
		}
	}
	return true;
}

function update_channels_position()
{
	for(var i = 0; i < array_length(self.membrane_channels); ++i;)
	{
		if instance_exists(self.membrane_channels[i])
		{
			var tmp_angle = 180 + 360 - self.membrane_channels[i].phy_rotation;
			var tmp_x = self.x + self.radius * sin(tmp_angle * pi / 180.);
			var tmp_y = self.y + self.radius * cos(tmp_angle * pi / 180.);
			self.membrane_channels[i].target_x = tmp_x;
			self.membrane_channels[i].target_y = tmp_y;
		}
	}

	var to_remove = [];
	for(var i = 0; i < array_length(self.membrane_channels); ++i;)
	{
		for(var j = 0; j < array_length(self.membrane_channels); ++j;)
		{	
			if i < j
			{
				if instance_exists(self.membrane_channels[i]) && instance_exists(self.membrane_channels[j])
				{
					var chan_a = self.membrane_channels[i];
					var chan_b = self.membrane_channels[j];
					if point_distance(chan_a.x, chan_a.y, chan_b.x, chan_b.y) < self.minimum_clearance_radius
					{
						array_push(to_remove, i);
					}
				}
			}
		}
	}

	for(var i = 0; i < array_length(to_remove); ++i;)
	{
		if instance_exists(self.membrane_channels[to_remove[i]])
		{
			instance_destroy(self.membrane_channels[to_remove[i]]);
		}
		remove_channel(self.membrane_channels[to_remove[i]])
	}
}

function remove_channel(channel_id)
{
	var channel_index = noone;
	for(var i = 0; i < array_length(self.membrane_channels); ++i)
	{
		if instance_exists(self.membrane_channels[i])
		{
			if self.membrane_channels[i].id == channel_id
			{
				channel_index = i;
				break
			}
		}
	}
	if channel_index != noone
	{
		array_delete(self.membrane_channels, channel_index, 1);
	}
}

function spawn_passive_blue_channel()
{
	var angle = random_range(0, 2 * pi);
	
	var tmp_x = self.x + self.radius * sin(angle);
	var tmp_y = self.y + self.radius * cos(angle);

	var new_channel = instance_create_layer(
		tmp_x,
		tmp_y,
		"lay_channels",
		obj_passive_channel_blue
	);

	new_channel.phy_angular_velocity = 0;
	new_channel.phy_position_x = tmp_x;
	new_channel.phy_position_y = tmp_y;
	new_channel.phy_speed_x = 0.;
	new_channel.phy_speed_y = 0.;
	new_channel.phy_rotation = 180 + 360 - (angle * 180 / pi);
	new_channel.cell_id = self;
	array_push(self.membrane_channels, new_channel);
}

function spawn_factory()
{
	dist = self.radius - 48
	tmp_angle = random_range(0, 360) * pi / 180;
	tmp_x = self.x + dist * cos(tmp_angle);
	tmp_y = self.y + dist * sin(tmp_angle);
	tmp_recipe = instance_create_layer(tmp_x, tmp_y, "lay_channels", obj_ribosome);
	tmp_recipe.init_kick = true;
}

function spawn_research_factory()
{
	dist = self.radius - 48
	tmp_angle = random_range(0, 360) * pi / 180;
	tmp_x = self.x + dist * cos(tmp_angle);
	tmp_y = self.y + dist * sin(tmp_angle);
	tmp_recipe = instance_create_layer(tmp_x, tmp_y, "lay_channels", obj_nucleus);
	tmp_recipe.init_kick = true;
}

function spawn_waste_block()
{
	var tmp_angle = random_range(0, 360) * pi / 180;
	var tmp_x = self.x + (self.radius - 30) * cos(tmp_angle);
	var tmp_y = self.y + (self.radius - 30) * sin(tmp_angle);

	var tmp_waste = instance_create_layer(tmp_x, tmp_y, "lay_blocks", obj_block_waste);
	tmp_waste.init_kick = true;
}

function count_DNA_tokens()
{
	self.n_research_in_cell = 0;
	for (var i = 0; i < instance_number(obj_research_token); ++i;)
	{
	    tmp_research_token = instance_find(obj_research_token, i);
		if (point_distance(self.x, self.y, tmp_research_token.x, tmp_research_token.y) < self.radius)
		{
			self.n_research_in_cell += 1
		}
	}
}

function count_blocks()
{
	var _list = ds_list_create();
	self.n_block_blue = collision_circle_list(self.x, self.y, self.radius, obj_block_blue, false, false, _list, false);
	ds_list_destroy(_list);
	
	var _list = ds_list_create();
	self.n_block_green = collision_circle_list(self.x, self.y, self.radius, obj_block_green, false, false, _list, false);
	ds_list_destroy(_list);
	
	var _list = ds_list_create();
	self.n_block_orange = collision_circle_list(self.x, self.y, self.radius, obj_block_orange, false, false, _list, false);
	ds_list_destroy(_list);
	
	var _list = ds_list_create();
	self.n_block_waste = collision_circle_list(self.x, self.y, self.radius, obj_block_waste, false, false, _list, false);
	ds_list_destroy(_list);
	
	var _list = ds_list_create();
	self.n_block_energy = collision_circle_list(self.x, self.y, self.radius, obj_energy, false, false, _list, false);
	ds_list_destroy(_list);
}

function select_random_DNA_token()
{
	if !self.n_research_in_cell
	{
		return noone;
	}

	var tmp_selected_DNA_token = noone;
	for (var i = 0; i < instance_number(obj_research_token); ++i;)
	{
		var tmp_DNA_token = instance_find(obj_research_token, i);
		if (point_distance(self.x, self.y, tmp_DNA_token.x, tmp_DNA_token.y) < self.radius)
		{
			return tmp_DNA_token
		}
	}
}

function compute_density()
{
	total_surface = 0;
	for  (var i = 0; i < array_length(self.contains_instances); ++i;)
	{
		if object_is_ancestor(self.contains_instances[i].object_index, obj_channel)
		{
			if !self.contains_instances[i].looking_for_membrane_slot
			{
				total_surface += 0.25 * self.contains_instances[i].mass;
				continue;
			}
		}
		total_surface += self.contains_instances[i].mass;
	}
	total_surface += self.n_research_in_cell * (pi * 24 * 24);
	total_surface += self.n_block_blue * (pi * 12 * 12);
	total_surface += self.n_block_green * (pi * 12 * 12);
	total_surface += self.n_block_orange * (pi * 12 * 12);
	total_surface += self.n_block_waste * (pi * 12 * 12);
	total_surface += self.n_block_energy * (pi * 12 * 12);
	effective_cell_radius = self.radius - 12;
	self.density = 100 * total_surface / (pi * effective_cell_radius * effective_cell_radius);
	self.density = 1.7 * self.density; // OFFSET
}

function dismantle_cell()
{
	// Free blocks
	for (var i = 0; i < array_length(self.blocks); ++i)
	{
		if (random_range(0, 1) < 0.9)
		{
			if (random_range(0, 1) < 0.5)
			{
				instance_create_layer(
					self.blocks[i].x, self.blocks[i].y, "lay_blocks", obj_block_blue
				);
			}
			else
			{
				instance_create_layer(
					self.blocks[i].x, self.blocks[i].y, "lay_blocks", obj_block_waste
				);
			}
		}

		instance_destroy(self.blocks[i]);
	}

	self.blocks = []

	// Free channels
	for (var i = 0; i < array_length(self.membrane_channels); ++i)
	{
		if instance_exists(self.membrane_channels[i])
		{
			instance_destroy(self.membrane_channels[i]);
		}
	}
	self.membrane_channels = [];
}

function extend_membrane()
{
	self.n_blocks_in_membrane += 1;
	audio_play_sound(beep_6_96243, 10, false);
	self.flag_extend_ring = false;
	spawn_increase_membrane();
	update_channels_position();
}

function decay_membrane()
{
	for(i = 0; i < self.n_blocks_in_membrane; ++i)
	{
		if random_range(0, 100) > (100 - (0.0003 * global.current_speed_up))
		{
			self.n_blocks_in_membrane -= 1;
			audio_play_sound(marimba_note_struck_88596, 10, false);
			spawn_decrease_membrane();
			update_channels_position();
			self.spawn_waste_block();
		}
	}
}

spawn_membrane();
spawn_passive_blue_channel();
spawn_factory();
spawn_research_factory();

