if self.target_x != noone
{
	var _speed = 3;
	if point_distance(self.x, self.y, self.target_x, self.target_y) > _speed
	{
		dx = self.target_x - self.x;
		dy = self.target_y - self.y;
		dd = point_distance(self.x, self.y, self.target_x, self.target_y);

		self.phy_position_x = self.phy_position_x + (_speed * (dx / dd));
		self.phy_position_y = self.phy_position_y + (_speed * (dy / dd));
	}
	else
	{
		self.target_x = noone;
		self.target_y = noone;
	}
}
else
{
	self.capturer_id = noone;
}
