event_inherited()

self.pause.x = self.x;
self.pause.y = self.y;

update_channel_positions();

if self.looking_for_membrane_slot
{
	check_for_free_space();
}
else
{
	if !self.pause_channel && self.type_obj_passing != noone
	{
		catch_block();

		if instance_exists(self.traversing_molecule_id)
		{
			resolve_first_section();
		}

		if instance_exists(self.traversing_molecule_id2)
		{
			resolve_second_section();
		}
	}

	if (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id))
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

if position_meeting(mouse_x, mouse_y, id){
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