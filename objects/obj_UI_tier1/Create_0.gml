UI_built_object = [
	[obj_passive_channel_blue_free_floating, 0, [obj_block_blue, obj_block_blue]],
	[obj_passive_channel_green_free_floating, 5, [obj_block_blue, obj_block_blue, obj_block_blue]],
	[obj_passive_channel_orange_free_floating, 5, [obj_block_blue, obj_block_blue, obj_block_blue, obj_block_blue]],

	[obj_waste_condenser, 5, [obj_block_blue, obj_block_blue, obj_block_green]],
	[obj_blue_condenser, 5, [obj_block_blue, obj_block_blue, obj_block_blue, obj_block_green]],
	[obj_green_condenser, 5, [obj_block_blue, obj_block_blue, obj_block_blue, obj_block_blue, obj_block_green]],

	[obj_channel_blue_free_floating, 15, [obj_block_blue, obj_block_blue, obj_block_orange]],
	[obj_channel_green_free_floating, 15, [obj_block_blue, obj_block_blue, obj_block_blue, obj_block_orange]],
	[obj_channel_orange_free_floating, 15, [obj_block_blue, obj_block_blue, obj_block_blue, obj_block_blue, obj_block_orange]],

	[obj_ribosome, 10, [obj_block_blue, obj_block_green, obj_block_orange]],
	[obj_nucleus, 10, [obj_block_blue, obj_block_green, obj_block_orange]],
	[],

	[obj_passive_expender_free_floating, 5, [obj_block_blue, obj_block_blue, obj_block_green]],
	[obj_expender_free_floating, 15, [obj_block_blue, obj_block_blue, obj_block_green, obj_block_orange]],
	[obj_bumper_free_floating, 15, [obj_block_blue, obj_block_blue, obj_block_orange]],

	[], [], [],

	[obj_large_ribosome, 30, [obj_block_blue, obj_block_green, obj_block_green, obj_block_orange, obj_block_orange]],
	[obj_large_nucleus, 35, [obj_block_blue, obj_block_blue, obj_block_blue, obj_block_green, obj_block_green, obj_block_orange, obj_block_orange]],
	[obj_chloroplaste, 30, [obj_block_blue, obj_block_blue, obj_block_blue, obj_block_green, obj_block_orange, obj_block_orange]],
	[obj_fission_reactor, 40, [obj_block_blue, obj_block_blue, obj_block_blue, obj_block_green, obj_block_orange, obj_block_orange, obj_block_orange]],
	[obj_healer, 40, [obj_block_blue, obj_block_blue, obj_block_blue, obj_block_green, obj_block_green, obj_block_green, obj_block_orange]],
];

sub_elements = [];
for(i = 0; i < array_length(self.UI_built_object); ++i)
{
	var tmp_x = 1635 + ((i % 3) * 108);
	var tmp_y = 72 + (floor(i / 3) * 108);
	
	if array_length(self.UI_built_object[i])
	{
		var tmp_element = instance_create_layer(tmp_x, tmp_y, "lay_UI_upper", obj_UI_recipe_button);
		tmp_element.x = tmp_x;
		tmp_element.y = tmp_y;
		tmp_element.built_object = self.UI_built_object[i][0];
		tmp_element.build_cost = UI_built_object[i][2];
		tmp_element.unlock_price = UI_built_object[i][1];
		if !UI_built_object[i][1]
		{
			tmp_element.locked = false;
		}
		array_push(self.sub_elements, tmp_element);
	}
}

function turn_unvisible()
{
	self.visible = false;
	for(i = 0; i < array_length(self.sub_elements); ++i)
	{
		self.sub_elements[i].visible = false;
	}	
}

function turn_visible()
{
	self.visible = true;
	for(i = 0; i < array_length(self.sub_elements); ++i)
	{
		self.sub_elements[i].visible = true;
	}	
}