if (mouse_check_button_pressed(mb_left) && position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id))
{
	if global.current_speed_up < 8
	{
		global.current_speed_up = global.current_speed_up * 2;
		for (var _i=0; _i < instance_number(obj_dynamicParent); ++_i)
		{
			var _o = instance_find(obj_dynamicParent, _i);
			_o.phy_speed_x = _o.phy_speed_x * 2;
			_o.phy_speed_y = _o.phy_speed_y * 2;
			_o.phy_angular_velocity = _o.phy_angular_velocity * 2;
		}
	}
}
