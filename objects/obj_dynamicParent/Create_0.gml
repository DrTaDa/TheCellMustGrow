selected = false;
bound_to = [];
fixed_position = noone;
init_kick = false;
in_membrane = false;
target_x = noone;
target_y = noone;
captured = false;
capturer_id = noone;
following = false;

function resolve_dragged(){
	if self.target_x != noone
	{
		var _speed = 4 * global.current_speed_up;
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
			self.phy_position_x = self.target_x;
			self.phy_position_y = self.target_y;
			
			self.target_x = noone;
			self.target_y = noone;
		}
	}
	else
	{
		self.capturer_id = noone;
	}
}

function resolve_bounce_on_walls(){
	if (self.x < 0 + self.radius) self.phy_speed_x = -self.phy_speed_x;
	if (self.y < 0 + self.radius) self.phy_speed_y = -self.phy_speed_y;
	if (self.x > room_height - self.radius) self.phy_speed_x = -self.phy_speed_x;
	if (self.y > room_height - self.radius)  self.phy_speed_y = -self.phy_speed_y;
}

function apply_initial_kick(){
	init_kick = false;
	var _force = 1000 * global.current_speed_up;
	physics_apply_force(
		self.x, self.y, random_range(-_force, _force), random_range(-_force, _force)
	);
}

