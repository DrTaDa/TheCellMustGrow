event_inherited()

self.pause.x = self.x;
self.pause.y = self.y;

if position_meeting(mouse_x, mouse_y, id){
	custom_alarm_display_info += 1;
	if custom_alarm_display_info > 30
	{
		self.flag_display_UI_info = true;
	}
	
	if mouse_check_button_pressed(mb_left)
	{
		if !self.pause_channel
		{
			self.pause_channel = true;
		}
		else
		{
			self.pause_channel = false;
		}
	}
}
else
{
	custom_alarm_display_info = 0;
	self.flag_display_UI_info = false;
}

if custom_alarm1 > 0
{
	custom_alarm1 -= 1 * global.current_speed_up;
}
else
{
	audio_play_sound(marimba_note_struck_88596, 10, false);
	var tmp_waste = instance_create_layer(x, y, "lay_blocks", obj_block_waste);
	tmp_waste.init_kick = true;
	instance_destroy(self);
}

if self.custom_alarm0 != noone
{
	if self.custom_alarm0 > 0
	{
		self.custom_alarm0 -= 1 * global.current_speed_up;
	}
	if self.custom_alarm0 <= 0
	{
		self.custom_alarm0 = noone;
		alarm[0] = 1;
	}
}

if not self.triggered_alarm
{
	self.check_trigger_alarm();
}