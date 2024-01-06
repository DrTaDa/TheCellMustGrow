event_inherited();

recipe_range = 85;
captured_recipe = noone;
abstract_recipe_target = noone;
capturer_positions = noone;

function instantiate_n_capturer(n)
{
	for(i = 0; i < array_length(self.capturers); ++i)
	{
		instance_destroy(self.capturers[i]);
	}
	self.capturers = [];
	
	for(i = 0; i < array_length(self.captured_recipe.cost); ++i)
	{
		self.instantiate_capturer(
			self.captured_recipe.cost[i],
			self.capturer_positions[i][0],
			self.capturer_positions[i][1],
			self.capturer_positions[i][2]
		);
	}

}

function release_recipe()
{
	if self.captured_recipe
	{
		if instance_exists(self.captured_recipe)
		{
			self.captured_recipe.following = false;
			self.captured_recipe.captured = false;
			self.captured_recipe.capturer_id = noone;
			self.captured_recipe.phy_active = true;
			self.captured_recipe.target_x = noone;
			self.captured_recipe.target_y = noone;
			self.captured_recipe = noone;
		}
		for(i = 0; i < array_length(self.capturers); ++i)
		{
			instance_destroy(self.capturers[i]);
		}
		self.capturers = [];
	}
}
