self.relative_distance = 0;
self.relative_angle = 0;
self.range = 45;
self.owner = noone;
self.target = noone;
self.target_type = noone;
self.target_sprite = noone;
self.target_on_capturer = false;
self.duration_use = 0; // 0 instantanous, if positive use for n seconds.
self.current_duration_use = 0;
self.consuming = false;
self.remove_consumed_from_counter = false;
self.target_sprite = noone; // Load the sprite of the target
self.cell = instance_find(obj_player_cell, 0);

function load_target_sprite()
{
	var tmp_obj_name = object_get_name(self.target_type);
	var tmp_spr_name = "spr_" + string_delete(tmp_obj_name, 1, 4);
	self.target_sprite = asset_get_index(tmp_spr_name);
}

function update_position()
{
	if self.owner != noone
	{
		if instance_exists(self.owner)
		{
			var rad_angle = pi * (self.owner.phy_rotation + self.relative_angle) / 180;
			self.x = self.owner.x + (self.relative_distance * cos(rad_angle));
			self.y = self.owner.y + (self.relative_distance * sin(rad_angle));
			self.image_angle = - self.owner.phy_rotation;
		}
	}
}

function update_target_position()
{
	if self.target
	{
		self.target.target_x = self.x;
		self.target.target_y = self.y;
	}
}

function look_for_target()
{
	if self.target_type && self.target == noone && !self.target_on_capturer
	{
		var tmp_target = instance_nearest(self.x, self.y, self.target_type);
	
		if tmp_target != noone
		{
			if !tmp_target.captured{
				if point_distance(self.owner.x, self.owner.y, tmp_target.x, tmp_target.y) < sprite_get_width(object_get_sprite(self.owner.object_index)) - 10
				{
					tmp_target.captured = true;
					tmp_target.capturer_id = self;
					tmp_target.phy_active = false;
					tmp_target.target_x = self.x;
					tmp_target.target_y = self.y;
					self.target = tmp_target;
				}
			}
		}
	}
}

function check_position_target()
{
	if self.target != noone
	{
		if point_distance(self.x, self.y, self.target.x, self.target.y) < 10
		{
			consume_target();
		}
	}
}

function consume_target()
{
	instance_destroy(self.target);
	self.target_on_capturer = true;
	self.target = noone;
	self.current_duration_use = 0;
	self.consuming = true;
}

function spend_target()
{
	self.consuming = false;
	self.target_on_capturer = false;
	self.current_duration_use = 0;
}

function spend_target_duration()
{
	if self.duration_use != 0
	{
		if self.current_duration_use >= self.duration_use
		{
			spend_target()
		}
		else
		{
			self.current_duration_use += global.current_speed_up * delta_time / 1000000;
		}
	}
}

function release_target()
{
	if self.target
	{
		self.target.captured = false;
		self.target.capturer_id = noone;
		self.target.phy_active = true;
		self.target.target_x = noone;
		self.target.target_y = noone;
	}
	
	self.target = noone;
	self.target_on_capturer = false;
	self.current_duration_use = 0;
	// Maybe later will create a block 
}
