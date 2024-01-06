image_alpha = 1.0;
freq = 0.2;

if custom_alarm1 < 1000
{
	image_alpha = 0.5 + (0.5 * (1 + sin(freq * custom_alarm1)));
}

draw_self()
