event_inherited()

if !self.target_sprite
{
	load_target_sprite();
}

if is_clicked()
{
	resolve_clicked();
}

if self.capturer_id != noone
{
	if !instance_exists(self.capturer_id)
	{
		self.captured = false;
		self.capturer_id = noone;
		self.target_x = noone;
		self.target_y = noone;
		self.following = false;
		self.phy_active = true;
	}
}
else
{
	self.captured = false;
	self.capturer_id = noone;
	self.target_x = noone;
	self.target_y = noone;
	self.following = false;
	self.phy_active = true;
}
