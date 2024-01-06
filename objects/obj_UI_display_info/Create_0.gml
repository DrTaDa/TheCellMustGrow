self.formatted_object_name = noone;
self.display_text = noone;

function draw_text_sharp(tmp_x, tmp_y, _text, size_px)
{
	draw_set_font(Font4);
	draw_set_color(c_black);
	var currSize = string_height(_text);
	var scale = size_px / 100.;
	draw_text_transformed(tmp_x, tmp_y, _text, scale, scale, 0);
}