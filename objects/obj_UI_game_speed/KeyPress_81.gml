
if global.current_speed_up > 0.25
{
	global.current_speed_up = global.current_speed_up / 2;
	for (var _i=0; _i < instance_number(obj_dynamicParent); ++_i)
	{
		var _o = instance_find(obj_dynamicParent, _i);
		_o.phy_speed_x = _o.phy_speed_x / 2;
		_o.phy_speed_y = _o.phy_speed_y / 2;
		_o.phy_angular_velocity = _o.phy_angular_velocity / 2;
	}
}