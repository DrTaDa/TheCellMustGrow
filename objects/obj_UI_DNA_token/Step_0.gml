var _dist = point_distance(x, y, self.target.x, self.target.y);

if _dist < speed
{
	//self.target.locked = 1;
	//audio_play_sound(coins27_36030, 10, false);
	instance_destroy(self);
}
else
{
	direction = point_direction(x, y, self.target.x, self.target.y);
	x += lengthdir_x(speed, direction);
	y += lengthdir_y(speed, direction);
}