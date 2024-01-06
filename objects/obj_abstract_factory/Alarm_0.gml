spawn_target();
for(i = 0; i < array_length(self.capturers); ++i)
{
	self.capturers[i].spend_target();
}
self.triggered_alarm = false;
self.number_of_use += 1;
