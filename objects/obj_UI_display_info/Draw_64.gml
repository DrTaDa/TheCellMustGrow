
draw_sprite(self.sprite_index, 0, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));

draw_text_sharp(
	device_mouse_x_to_gui(0) + 10,
	device_mouse_y_to_gui(0) + 10,
	self.formatted_object_name,
	20
);

draw_text_sharp(
	device_mouse_x_to_gui(0) + 10,
	device_mouse_y_to_gui(0) + 40,
	"Remaining lifespan: " + string(floor(self.owner.custom_alarm1 / 3600)) + "m",
	20
);
	
draw_text_sharp(
	device_mouse_x_to_gui(0) + 10,
	device_mouse_y_to_gui(0) + 70,
	"Number of use: " + string(self.owner.number_of_use),
	20
);