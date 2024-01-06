game_title = "The Cell Must Grow ! ";

self.center_x = 1920 / 2;
self.center_y = 1080 / 2.1;
self.text_radius = 400;
self.n_char = string_length(self.game_title);

function draw_text_sharp(tmp_x, tmp_y, _text, size_px, _angle)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(fnt_default);
	draw_set_color(c_black);
	var currSize = string_height(_text);
	var scale = size_px / 100.;
	draw_text_transformed(tmp_x, tmp_y, _text, scale, scale, _angle);
}
