cell = instance_find(obj_player_cell, 0);
built_object = noone;
clickable = false;
locked = true;
unlock_price = 1;
build_cost = [obj_block_blue, obj_block_blue, obj_block_blue];
target_sprite = noone;
target_sprite_index = noone;
cost_sprites = [];
flag_display_UI_info = false;
custom_alarm_display_info = 0;
self.display_no_token = 0;
self.display_no_token_buy = 0;
blu = 0;

info_panel = instance_create_layer(0, 0, "lay_info_panels", obj_UI_recipe_display_info);
info_panel.owner = self;

function load_target_sprite()
{
	self.target_sprite = object_get_sprite(self.built_object);
	
	self.target_sprite_index = 0;
	if sprite_get_number(self.target_sprite) > 1
	{
		self.target_sprite_index = 1;
	}

	self.cost_sprites = [];
	for (var i = 0; i < array_length(self.build_cost); ++i;)
	{
		array_push(self.cost_sprites, object_get_sprite(self.build_cost[i]));
	}
}

function is_clicked()
{
	if (mouse_check_button_pressed(mb_left) && position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id))
	{
		return true;
	}
	
	return false;
}

function resolve_unlock()
{
	cell.count_DNA_tokens();

	if self.cell.n_research_in_cell < self.unlock_price
	{
		self.display_no_token_buy = 2;
		return 
	}

	audio_play_sound(click_151673, 10, false);

	var selected_DNA_tokens = [];
	for (var i = 0; i < instance_number(obj_research_token); ++i;)
	{
		var tmp_DNA_token = instance_find(obj_research_token, i);
		if (point_distance(self.cell.x, self.cell.y, tmp_DNA_token.x, tmp_DNA_token.y) < self.cell.radius)
		{
			array_push(selected_DNA_tokens, tmp_DNA_token);
			if (array_length(selected_DNA_tokens) == self.unlock_price)
			{
				break;
			}
		}
	}

	// Coordinate transform
	var _display_w = display_get_gui_width()
	var _display_h = display_get_gui_height()
	var _view_x = camera_get_view_x(view_camera[0]);
	var _view_y = camera_get_view_y(view_camera[0]);
	var _view_w = camera_get_view_width(view_camera[0]);
	var _view_h = camera_get_view_height(view_camera[0]);

	for (var i = 0; i < array_length(selected_DNA_tokens); ++i;)
	{
		// Room coordinate to GUI coordinate
		var _gui_x = (selected_DNA_tokens[i].x - _view_x) / _view_w
		var _gui_y = (selected_DNA_tokens[i].y - _view_y) / _view_h;

		var _token = instance_create_layer(
			_gui_x * _display_w,
			_gui_y * _display_h,
			"lay_UI_top",
			obj_UI_DNA_token
		);
		_token.target = self;

		instance_destroy(selected_DNA_tokens[i]);
	}

	self.locked = false;
}

function resolve_buy()
{
	cell.count_DNA_tokens();

	if cell.n_research_in_cell
	{
		var tmp_selected_DNA_token = cell.select_random_DNA_token();

		if tmp_selected_DNA_token != noone
		{
			var tmp_recipe_type = noone
			if array_length(self.build_cost) <= 5
			{
				tmp_recipe_type = obj_abstract_recipe_simple;
			}
			else
			{
				tmp_recipe_type = obj_abstract_recipe_advanced;
			}
			if tmp_recipe_type
			{
				var tmp_recipe = instance_create_layer(
					tmp_selected_DNA_token.x,
					tmp_selected_DNA_token.y,
					"lay_recipes",
					tmp_recipe_type
				);
				tmp_recipe.phy_linear_velocity_x = tmp_selected_DNA_token.phy_linear_velocity_x;
				tmp_recipe.phy_linear_velocity_y = tmp_selected_DNA_token.phy_linear_velocity_y;
				tmp_recipe.phy_rotation = tmp_selected_DNA_token.phy_rotation;
				tmp_recipe.built_object = self.built_object;
				tmp_recipe.cost = self.build_cost;
				tmp_recipe.init_kick = false;
				instance_destroy(tmp_selected_DNA_token);
				audio_play_sound(click_151673, 10, false);
				global.first_recipe_clicked = true;
			}
		}
	}
}

function resolve_click()
{
	if !self.locked 
	{
		if self.clickable
		{
			resolve_buy();
		}
		else
		{
			self.display_no_token = 2;
		}
	}
	if self.locked
	{
		resolve_unlock();
	}
}

function update_sprite_color()
{
	if (cell.n_research_in_cell == 0 || self.locked)
	{
		image_blend = make_colour_rgb(180, 180, 180);
		self.clickable = false;
	}
	else
	{
		image_blend = make_colour_rgb(255, 255, 255);
		self.clickable = true;
	}
}

function draw_text_sharp(tmp_x, tmp_y, _text, size_px)
{
	draw_set_font(fnt_default);
	var currSize = string_height(_text);
	var scale = size_px / 100.;
	draw_text_transformed(tmp_x, tmp_y, _text, scale, scale, 0);
}