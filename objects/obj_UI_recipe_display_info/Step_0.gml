if self.owner.visible && self.owner.flag_display_UI_info
{
	if self.owner.x < (display_get_gui_width() - 420)
	{
		self.x = self.owner.x + 70;
		self.y = self.owner.y - 70;
	}
	else
	{
		self.x = self.owner.x - 420;
		self.y = self.owner.y - 70;
	}
}

if self.formatted_object_name == noone
{
	self.formatted_object_name = string_replace(
		object_get_name(self.owner.built_object),
		"obj_",
		""
	)
	self.formatted_object_name = string_replace_all(
			self.formatted_object_name,
			"free_floating",
			""
		);
	self.formatted_object_name = string_replace_all(
			self.formatted_object_name,
			"_",
			" "
		);
	self.formatted_object_name = string_upper(string_char_at(self.formatted_object_name, 1)
		) + string_delete(self.formatted_object_name, 1, 1);
		
	for (var _i = 0; _i < array_length(self.tuto_text); ++_i)
	{
		if self.tuto_text[_i][0] == object_get_name(self.owner.built_object)
		{
			self.display_text = self.tuto_text[_i][1];
			break;
		}
	}
	
	self.text_height = get_text_height();
	var _txt_height = get_text_height();
	_txt_height += 30; // Title size
	_txt_height += 64; // Formulas sprite size
	
	if _txt_height > 240
	{
		self.sprite_index = spr_UI_info_panel_L;
	}
	else if _txt_height > 160
	{
		self.sprite_index = spr_UI_info_panel_M;
	}
	else
	{
		self.sprite_index = spr_UI_info_panel_S;
	}
}

if self.target_sprite == noone
{
	load_target_sprite()
}

if self.owner == noone
{ 
	instance_destroy(self);
}
else if !instance_exists(self.owner)
{
	instance_destroy(self);
}