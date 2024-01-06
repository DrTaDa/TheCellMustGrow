if (init_kick)
{
	apply_initial_kick();
}

resolve_bounce_on_walls();

if following
{
	self.x = target_x;
	self.y = target_y;
	self.phy_position_x = target_x;
	self.phy_position_y = target_y;
}
else
{
	resolve_dragged();
}

/*if (fixed_position != noone)
{
	k_constant = 20.0;
	mass = 20;
	
	// compute distance to the eq position
	d = point_distance(x, y, fixed_position[0], fixed_position[1]);

	// Compute the force
	hooke_force = k_constant * d;
	dv = delta_time * hooke_force / mass / 1000000; // Convert us to s

	// Project force on direction of the bound
	tmp_theta = point_direction(x, y, fixed_position[0], fixed_position[1]);
	dv_x = dv * cos(tmp_theta * pi / 180);
	dv_y = dv * sin(tmp_theta * pi / 180);	
	
	// Update self speed
	phy_speed_x = phy_speed_x + dv_x;
	phy_speed_y = phy_speed_y - dv_y;
}

else if instance_exists(self.capturer_id)
{	
	dx = self.target_x - self.x;
	dy = self.target_y - self.y;
	self.phy_position_x = self.phy_position_x + dx / 10.;
	self.phy_position_y = self.phy_position_y + dy / 10.;
}
else
{
	self.capturer_id = noone;
}*/

/*if (selected)
{
	k_constant = 20.0;
	mass = 20;
	
	// compute distance to the eq position
	d = point_distance(x, y, mouse_x, mouse_y);

	// Compute the force
	hooke_force = k_constant * d;
	dv = delta_time * hooke_force / mass / 1000000; // Convert us to s

	// Project force on direction of the bound
	tmp_theta = point_direction(x, y,  mouse_x, mouse_y);
	dv_x = dv * cos(tmp_theta * pi / 180);
	dv_y = dv * sin(tmp_theta * pi / 180);	
	
	// Update self speed
	phy_speed_x = phy_speed_x + dv_x;
	phy_speed_y = phy_speed_y - dv_y;
}*/



// Apply Hooke force if part of a molecule
/*for (var i = 0; i < array_length(bound_to); i += 1)
{
	d_eq = 28.;
	k_constant = 10.0;
	mass = 20;

    // compute distance to the bound molecule
	d = point_distance(x, y, bound_to[i].x, bound_to[i].y);

	// Compute the force
	Force = k_constant * (d - d_eq);
	dv = delta_time * Force / mass / 1000000;

	// Project force on direction of the bound
	tmp_theta = point_direction(x, y, bound_to[i].x, bound_to[i].y);
	dv_x = dv * cos(tmp_theta * pi / 180);
	dv_y = dv * sin(tmp_theta * pi / 180);

	// Update self speed
	phy_speed_x = phy_speed_x + dv_x;
	phy_speed_y = phy_speed_y - dv_y;
	
	for (var j = 0; j < array_length(bound_to[i].bound_to); j += 1)
	{
		
		if (self.id != bound_to[i].bound_to[j].id)
		{
			d_eq_2 = 2 * 28.0;
			k_constant_2 = 10.0;
			mass = 20;

		    // compute distance to the bound molecule
			d = point_distance(x, y, bound_to[i].bound_to[j].x, bound_to[i].bound_to[j].y);

			// Compute the force
			Force = k_constant_2 * (d - d_eq_2);
			dv = delta_time * Force / mass / 1000000;

			// Project force on direction of the bound
			tmp_theta = point_direction(x, y, bound_to[i].bound_to[j].x, bound_to[i].bound_to[j].y);
			dv_x = dv * cos(tmp_theta * pi / 180);
			dv_y = dv * sin(tmp_theta * pi / 180);

			// Update self speed
			phy_speed_x = phy_speed_x + dv_x;
			phy_speed_y = phy_speed_y - dv_y;
		}
	}
}*/