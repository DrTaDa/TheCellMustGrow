if self.n_current_spawn < 31
{
	spawn_target();
	alarm[4] = 20;
	self.n_current_spawn += 1;
}
else
{
	alarm[4] = -1;
	self.n_current_spawn = 0;
}