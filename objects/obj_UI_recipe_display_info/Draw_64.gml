if self.owner.visible && self.owner.flag_display_UI_info
{
	draw_self()

	draw_text_sharp(
		self.x + 15,
		self.y + 10,
		self.formatted_object_name,
		20
	);

	draw_long_text_sharp(
		self.x + 15,
		self.y + 50,
		self.display_text,
		17
	);
	
	if self.target_sprite != noone && self.target_sprite != -1
	{
		draw_sprite_ext(
			self.target_sprite,
			0,
			self.x + 15 ,
			self.y + 50 + self.text_height, 
			0.8, 
			0.8, 
			0, 
			c_white,
			1
		);
	}
}