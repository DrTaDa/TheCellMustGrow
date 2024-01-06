event_inherited();

// If no recipe captured, try to capture
if self.captured_recipe == noone && !self.pause_channel
{
	tmp_recipe = instance_nearest(self.x, self.y, obj_abstract_recipe_simple);

	if tmp_recipe != noone
	{
		if !tmp_recipe.captured{
			if point_distance(self.x, self.y, tmp_recipe.x, tmp_recipe.y) < self.recipe_range
			{
				tmp_recipe.captured = true;
				tmp_recipe.capturer_id = self;
				tmp_recipe.phy_active = false;
				self.captured_recipe = tmp_recipe
					
				for(i = 0; i < array_length(self.captured_recipe.cost); ++i)
				{
					self.capturers[i].target_type = self.captured_recipe.cost[i];
					self.capturers[i].load_target_sprite();
				}
			}
		}
	}
}

if self.captured_recipe
{
	self.captured_recipe.target_x = self.x + (36 * cos(pi * (self.phy_rotation - 90) / 180));
	self.captured_recipe.target_y = self.y + (36 * sin(pi * (self.phy_rotation - 90) / 180));
}