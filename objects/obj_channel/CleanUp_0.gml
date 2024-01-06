free_targets();

if self.capturer
{
	if instance_exists(self.capturer)
	{
		instance_destroy(self.capturer);
	}
}

if self.capturer2
{
	if instance_exists(self.capturer2)
	{
		instance_destroy(self.capturer2);
	}
}

if instance_exists(self.cell)
{
	array_delete(
		self.cell.contains_instances, 
		array_get_index(cell.contains_instances, self),
		1
	);

	if !self.looking_for_membrane_slot
	{
		self.cell.remove_channel(self);
	}
}