if instance_exists(self.cell)
	{
		array_delete(
			cell.contains_instances, 
			array_get_index(cell.contains_instances, self),
			1
		);
	}

for(i = 0; i < array_length(self.capturers); ++i)
{
	if instance_exists(self.capturers[i])
	{
		if self.capturers[i].consuming && self.capturers[i].target_type != noone
		{
			instance_create_layer(
				self.capturers[i].x,
				self.capturers[i].y,
				"lay_blocks",
				self.capturers[i].target_type
			);
		}
		self.capturers[i].release_target();
		self.capturers[i].spend_target();
		self.capturers[i].target_type = noone;
		self.capturers[i].target_sprite = noone;
	}
	instance_destroy(self.capturers[i]);
}
