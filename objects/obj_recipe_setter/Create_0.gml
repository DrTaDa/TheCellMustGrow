event_inherited();

recipe_range = 70;
captured_recipe = noone;

self.instantiate_capturer(noone, 22, 0, 45);
self.instantiate_capturer(noone, 22, 90, 45);
self.instantiate_capturer(noone, 22, 180, 45);

function release_recipe()
{
	self.captured_recipe = noone;
	for(i = 0; i < array_length(self.capturers); ++i)
	{
		self.capturers[i].release_target()
	}
}