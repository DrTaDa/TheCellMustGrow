if self.formatted_object_name == noone
{
	self.formatted_object_name = string_replace(
		object_get_name(self.owner.object_index),
		"obj_",
		""
	)
	self.formatted_object_name = string_replace_all(
			self.formatted_object_name,
			"_",
			" "
	);
	self.formatted_object_name = string_replace_all(
			self.formatted_object_name,
			"free floating",
			""
	);
	self.formatted_object_name = string_upper(string_char_at(self.formatted_object_name, 1)
		) + string_delete(self.formatted_object_name, 1, 1);

}

if self.owner == noone
{ 
	instance_destroy(self);
}
else if !instance_exists(self.owner)
{
	instance_destroy(self);
}

self.visible = self.owner.flag_display_UI_info;
