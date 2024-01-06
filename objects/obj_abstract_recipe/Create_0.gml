event_inherited()

self.init_kick = true;
self.built_object = noone;
self.cost = [obj_block_blue, obj_block_blue, obj_block_blue];
self.target_sprite = noone;
self.target_sprite_scale = 0;
self.target_sprite_index = noone;

mass = sprite_width * sprite_width;

cell = instance_find(obj_player_cell, 0);
array_push(cell.contains_instances, self);

function load_target_sprite()
{
	self.target_sprite = object_get_sprite(self.built_object);
	self.target_sprite_index = 0;
	if sprite_get_number(self.target_sprite) > 1
	{
		self.target_sprite_index = 1;
	}
	var tmp_height = sprite_get_height(self.target_sprite);
	
	self.target_sprite_scale = 32 / tmp_height;
}

function is_clicked()
{
	if (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id))
	{
		return true;
	}

	return false;
}

function resolve_clicked()
{
	if self.captured && self.capturer_id != noone
	{
		self.capturer_id.release_recipe();
	}
	instance_destroy(self);
}