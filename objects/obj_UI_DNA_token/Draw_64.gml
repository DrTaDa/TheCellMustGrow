draw_sprite_ext(self.sprite_index, 0, x, y, 1, 1, 0, c_white, 1);

if global.debug
{
	draw_line_color(x, y, self.target.x, self.target.y, c_red, c_red);
}