
if self.display_no_token > 0
{
	draw_set_colour(c_red);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_sharp(
		x,
		y - 15,
		"No DNA tokens",
		20
	);
	draw_text_sharp(
		x,
		y + 15,
		"available",
		20
	);
	draw_set_colour(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}

if self.display_no_token_buy > 0
{
	draw_set_colour(c_red);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_sharp(
		x,
		y - 15,
		"Not enough DNA",
		20
	);
	draw_text_sharp(
		x,
		y + 15,
		"tokens to unlock",
		20
	);
	draw_set_colour(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}