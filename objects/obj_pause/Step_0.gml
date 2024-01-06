if self.owner == noone
{
	instance_destroy(self);
}
else if !instance_exists(self.owner)
{
	instance_destroy(self);
}