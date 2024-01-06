draw_set_colour(c_black); 
draw_set_font(Font4);

draw_text_sharp(
	0,
	0,
	"FPS = " + string(fps_real),
	16
);

var minutes =  string(floor(cell.time_alive / 1000000 / 60));
var seconds =  string(floor((cell.time_alive / 1000000) % 60));

draw_text_sharp(
	x + 10,
	y + 15,
	"Time alive: " + minutes + "m " + seconds + "s",
	28
);

draw_text_sharp(
	x + 10,
	y + 65,
	"Max cell size: " + string(cell.max_blocks_in_membrane),
	28
);

draw_text_sharp(
	x + 10,
	y + 115,
	"Cell size: " + string(cell.n_blocks_in_membrane),
	28
);

// List everything that is in the cell

// Factories
var tmp_x = 50
var tmp_y = 165 + 120;
var objects_found = [];
var n_instances = [];

for  (var i = 0; i < array_length(cell.contains_instances); ++i;)
{
	var tmp_obj_idx = array_get_index(objects_found, object_get_name(cell.contains_instances[i].object_index));
	if tmp_obj_idx >= 0
	{
		n_instances[tmp_obj_idx] += 1;
	}
	else
	{
		array_push(n_instances, 1);
		array_push(objects_found,  object_get_name(cell.contains_instances[i].object_index))
	}
}

cell.n_recipes = 0;

for  (var i = 0; i < array_length(objects_found); ++i;)
{
	
	if objects_found[i] == "obj_abstract_recipe_simple" || objects_found[i] == "obj_abstract_recipe_advanced"
	{
		cell.n_recipes += n_instances[i];
	}

	else
	{
		var tmp_target_sprite = object_get_sprite(asset_get_index(objects_found[i]));
	
		if sprite_get_number(tmp_target_sprite) > 1
		{
			draw_sprite(tmp_target_sprite, 1, tmp_x, tmp_y);
		}
		else
		{
			draw_sprite(tmp_target_sprite, 0, tmp_x, tmp_y);
		}
		draw_text_sharp(
			tmp_x - 30,
			tmp_y - 40,
			string(n_instances[i]),
			32
		);
		tmp_y += 95
		if tmp_y > 1000
		{
			tmp_y = 165 + 120;
			tmp_x += 95
		}
	}
}

if cell.n_recipes
{
	draw_sprite_ext(spr_recipe, 0, tmp_x, tmp_y, 1.5, 1.5, 0, c_white, 1);
	draw_text_sharp(
		tmp_x - 30,
		tmp_y - 44,
		string(cell.n_recipes),
		32
	);

	tmp_y += 95
	if tmp_y > 1000
	{
		tmp_y = 165 + 120;
		tmp_x += 95
	}
}

if cell.n_research_in_cell
{
	var tmp_target_sprite = object_get_sprite(obj_research_token);
	draw_sprite_ext(tmp_target_sprite, 0, tmp_x, tmp_y, 1.5, 1.5, 0, c_white, 1);
	draw_text_sharp(
		tmp_x - 30,
		tmp_y - 44,
		string(cell.n_research_in_cell),
		32
	);

	tmp_y += 95
	if tmp_y > 1000
	{
		tmp_y = 165 + 120;
		tmp_x += 95
	}
}

if cell.n_block_blue
{
	var tmp_target_sprite = object_get_sprite(obj_block_blue);
	draw_sprite_ext(tmp_target_sprite, 0, tmp_x, tmp_y, 2.0, 2.0, 0, c_white, 1);
	draw_text_sharp(
		tmp_x - 30,
		tmp_y - 44,
		string(cell.n_block_blue),
		32
	);
	tmp_y += 95
	if tmp_y > 1000
	{
		tmp_y = 165 + 120;
		tmp_x += 95
	}
}

if cell.n_block_green
{
	var tmp_target_sprite = object_get_sprite(obj_block_green);
	draw_sprite_ext(tmp_target_sprite, 0, tmp_x, tmp_y, 2.0, 2.0, 0, c_white, 1);
	draw_text_sharp(
		tmp_x - 30,
		tmp_y - 44,
		string(cell.n_block_green),
		32
	);
	tmp_y += 95
	if tmp_y > 1000
	{
		tmp_y = 165 + 120;
		tmp_x += 95
	}
}

if cell.n_block_orange
{
	var tmp_target_sprite = object_get_sprite(obj_block_orange);
	draw_sprite_ext(tmp_target_sprite, 0, tmp_x, tmp_y, 2.0, 2.0, 0, c_white, 1);
	draw_text_sharp(
		tmp_x - 30,
		tmp_y - 44,
		string(cell.n_block_orange),
		32
	);
	tmp_y += 95
	if tmp_y > 1000
	{
		tmp_y = 165 + 120;
		tmp_x += 95
	}
}

if cell.n_block_waste
{
	var tmp_target_sprite = object_get_sprite(obj_block_waste);
	draw_sprite_ext(tmp_target_sprite, 0, tmp_x, tmp_y, 2.0, 2.0, 0, c_white, 1);
	draw_text_sharp(
		tmp_x - 30,
		tmp_y - 44,
		string(cell.n_block_waste),
		32
	);
	tmp_y += 95
	if tmp_y > 1000
	{
		tmp_y = 165 + 120;
		tmp_x += 95
	}
}

if cell.n_block_energy
{
	var tmp_target_sprite = object_get_sprite(obj_energy);
	draw_sprite_ext(tmp_target_sprite, 0, tmp_x, tmp_y, 2.0, 2.0, 0, c_white, 1);
	draw_text_sharp(
		tmp_x - 30,
		tmp_y - 44,
		string(cell.n_block_energy),
		32
	);
	tmp_y += 95
	if tmp_y > 1000
	{
		tmp_y = 165 + 120;
		tmp_x += 95
	}
}

draw_set_colour(c_black); 

draw_scale = 2.5
if cell.density > 65
{
	draw_set_colour($00A5FF);
	draw_scale = 2.75;
}
if cell.density > 85
{
	draw_set_colour(c_red);
	draw_scale = 3;
}

draw_text_sharp(
	x + 20,
	y + 165,
	"Density: " + string_format(cell.density, 3, 1) + "%",
	28
);