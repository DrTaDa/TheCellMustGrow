self.formatted_object_name = noone;
self.target_sprite = noone;
self.display_text = noone;
self.text_height = noone;

self.tuto_text = [
	["obj_passive_channel_blue_free_floating", "Allows blue blocks to enter the cell."],
	["obj_passive_channel_green_free_floating", "Allows green blocks to enter the cell."],
	["obj_passive_channel_orange_free_floating", "Allows orange blocks to enter the cell."],
	["obj_waste_condenser", "Transforms two gray blocks into one blue blocks."],
	["obj_blue_condenser", "Transforms two blue blocks into one green blocks."],
	["obj_green_condenser", "Transforms two green blocks into one orange blocks."],
	["obj_channel_blue_free_floating", "Allows blue blocks to enter the cell. Can use energy to increase its range."],
	["obj_channel_green_free_floating", "Allows green blocks to enter the cell. Can use energy to increase its range."],
	["obj_channel_orange_free_floating", "Allows orange blocks to enter the cell. Can use energy to increase its range."],
	["obj_ribosome", "Uses RNA recipes and a maximum of five blue/green/orange blocks to create new objects."],
	["obj_nucleus", "Transforms three blue blocks into one DNA token."],
	["obj_passive_expender_free_floating", "Uses blue block to increase the size of the membrane."],
	["obj_expender_free_floating", "Uses blue block to increase the size of the membrane. Can use energy to increase its range."],
	["obj_bumper_free_floating", "Produces energy from the bouncing of blue/green/orange blocks on it"],
	["obj_large_ribosome", "Uses RNA recipes and a maximum of seven blue/green/orange blocks to create new objects."],
	["obj_large_nucleus", "Transform six blue blocks into three DNA token. Can only be produced by a large ribosome."],
	["obj_chloroplaste", "Produces two energy every 45 seconds. Can only be produced by a large ribosome."],
	["obj_fission_reactor", "Transform six orange blocks and one energy into 32 blue blocks. Can only be produced by a large ribosome."],
	["obj_healer", "Uses two green blocks to rejuvenate another dying channel, ribosome, nucleus, etc. Can only be produced by a large ribosome."]
]

function load_target_sprite()
{
	var tmp_obj_name = object_get_name(self.owner.built_object);
	tmp_obj_name = string_replace(tmp_obj_name, "_free_floating", "");
	var tmp_spr_name = "spr_fr_" + string_delete(tmp_obj_name, 1, 4);
	self.target_sprite = asset_get_index(tmp_spr_name);
	if !sprite_exists(self.target_sprite)
	{
		self.target_sprite = -1;
	}
}

function draw_text_sharp(tmp_x, tmp_y, _text, size_px)
{
	draw_set_font(Font4);
	draw_set_color(c_black);
	var currSize = string_height(_text);
	var scale = size_px / 100.;
	draw_text_transformed(tmp_x, tmp_y, _text, scale, scale, 0);
}

function get_text_height()
{
	draw_set_font(Font4);
	draw_set_color(c_black);
	var currSize = string_height(self.display_text);
	var scale = 17 / 100.;
	var _height = string_height_ext(self.display_text, -1, 1900);
	return _height * scale;
}

function draw_long_text_sharp(tmp_x, tmp_y, _text, size_px)
{
	draw_set_font(Font4);
	draw_set_color(c_black);
	var currSize = string_height(_text);
	var scale = size_px / 100.;
	draw_text_ext_transformed(tmp_x, tmp_y, _text, 8 * size_px, 1900, scale, scale, 0);
}