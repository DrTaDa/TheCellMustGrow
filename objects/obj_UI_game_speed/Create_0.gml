global.current_speed_up = 1;

function draw_text_sharp(tmp_x, tmp_y, _text, size_px)
{
	draw_set_font(Font4);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_black);
	var currSize = string_height(_text);
	var scale = size_px / 100.;
	draw_text_transformed(tmp_x, tmp_y, _text, scale, scale, 0);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
}

instance_create_layer(960 - 140, 60, "lay_UI_upper", obj_UI_game_speed_down);
instance_create_layer(960 + 140, 60, "lay_UI_upper", obj_UI_game_speed_up);
