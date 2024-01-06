image_alpha = 1.0;
freq = 0.2;

if custom_alarm1 < 1000
{
	image_alpha = 0.5 + (0.5 * (1 + sin(freq * custom_alarm1)));
}

draw_self()

/*if self.flag_display_UI_info
{
	if self.capturer
	{
		draw_circle_colour(
			self.capturer.x, 
			self.capturer.y, 
			self.capturer.range,
			c_white, 
			c_white,
			true
		);
	}
	if self.capturer2
	{
		draw_circle_colour(
			self.capturer2.x, 
			self.capturer2.y, 
			self.capturer2.range,
			c_white, 
			c_white,
			true
		);
	}
	
	draw_circle_colour(
		self.entrance_x, 
		self.entrance_y, 
		self.range_passive,
		c_white, 
		c_white,
		true
	);
	
	draw_circle_colour(
		self.entrance_x, 
		self.entrance_y, 
		self.range_active,
		c_white, 
		c_white,
		true
	);
}*/