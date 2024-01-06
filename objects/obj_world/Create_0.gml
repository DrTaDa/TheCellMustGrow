// SET RANDOM SEED
t = date_current_datetime();
h = date_get_hour(t);
m = date_get_minute(t);
s = date_get_second(t);
random_set_seed(h + m + s);

global.first_recipe_clicked = false;
global.debug = false;
global.current_speed_up = 1;

self.world_surface = pi * self.world_radius * self.world_radius;

self.spawn_x_offset = floor(self.world_radius / 2.0);
self.spawn_y_offset = floor(self.world_radius / 2.0);

self.center_radius_offset = 100 / self.world_radius;

self.n_molecule_block1 = floor(self.density_block1 * self.world_surface);
self.n_molecule_block2 = floor(self.density_block2 * self.world_surface);
self.n_molecule_block3 = floor(self.density_block3 * self.world_surface);
self.n_molecule_energy = floor(self.density_energy * self.world_surface);

self.flag_gameover = false;
self.flag_game_loaded = false;

function random_angle_degrees()
{
	return random_range(0, 360);
}

function random_angle_rad()
{
	return random_angle_degrees() * pi / 180;
}

function random_distance_from_world_center()
{
	
	return 0.5 * self.world_radius * sqrt(self.center_radius_offset + random_range(self.center_radius_offset, 1.0));
}

function spawn_molecule_random_position(obj_type, lay)
{
	var valid_spawn = false;
	
	while !valid_spawn
	{
		var rand_x = room_width * random_range(0, 1.0);
		var rand_y = room_width * random_range(0, 1.0);
		
		if point_distance(rand_x, rand_y, room_width / 2, room_width / 2) > 250
		{
			valid_spawn = true;
		}
	}

	tmp_obj = instance_create_layer(rand_x, rand_y, lay, obj_type);
	tmp_obj.init_kick = true;
}

function draw_text_sharp(tmp_x, tmp_y, _text, size_px)
{
	draw_set_font(Font4);
	var currSize = string_height(_text);
	var scale = size_px / 100.;
	draw_text_transformed(tmp_x, tmp_y, _text, scale, scale, 0);
}

self.alarm[8] = 2;