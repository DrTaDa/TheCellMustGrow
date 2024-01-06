event_inherited();

tmp_x = self.x + 27. * cos((self.phy_rotation - 3) * pi / 180);
tmp_y = self.y + 27. * sin((self.phy_rotation - 3) * pi / 180);
tmp_x2 = self.x + 27. * cos((self.phy_rotation + 183) * pi / 180);
tmp_y2 = self.y + 27. * sin((self.phy_rotation + 183) * pi / 180);

draw_set_alpha(self.custom_alarm0 / self.threshold_alarm0);
draw_sprite(self.energy_sprite, 0, tmp_x, tmp_y);
draw_sprite(self.energy_sprite, 0, tmp_x2, tmp_y2);
draw_set_alpha(1);
