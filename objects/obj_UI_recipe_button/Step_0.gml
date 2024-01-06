if !self.target_sprite
{
	load_target_sprite();
}

if self.visible
{
	if self.is_clicked()
	{
		resolve_click();
	}

	update_sprite_color();
}

if position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id)
{
	custom_alarm_display_info += 1;
	if custom_alarm_display_info > 30
	{
		self.flag_display_UI_info = true;
	}
}
else
{
	custom_alarm_display_info = 0;
	self.flag_display_UI_info = false;
}

if self.display_no_token > 0
{
	self.display_no_token -= delta_time / 1000000;
}

if self.display_no_token_buy > 0
{
	self.display_no_token_buy -= delta_time / 1000000;
}