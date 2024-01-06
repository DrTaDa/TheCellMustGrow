self.x = 20;
self.y = 20;
self.image_alpha = 0.85;
self.cell = instance_find(obj_player_cell, 0);

function draw_text_sharp(tmp_x, tmp_y, _text, size_px)
{
	draw_set_font(Font4);
	var currSize = string_height(_text);
	var scale = size_px / 100.;
	draw_text_transformed(tmp_x, tmp_y, _text, scale, scale, 0);
}