audio_play_sound(mixkit_game_ball_tap_2073, 10, false);

var tmp_object = instance_create_layer(x, y, "lay_channels", self.captured_recipe.built_object);
tmp_object.init_kick = true;

self.triggered_alarm = false;

for(i = 0; i < array_length(self.capturers); ++i)
{
	self.capturers[i].spend_target();
	self.capturers[i].target_type = noone;
	self.capturers[i].target_sprite = noone;
}

instance_destroy(self.captured_recipe);
self.captured_recipe = noone;
self.number_of_use += 1;
