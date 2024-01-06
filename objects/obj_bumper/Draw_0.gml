event_inherited();

tmp_x = self.x + 24. * cos((self.phy_rotation + 90) * pi / 180);
tmp_y = self.y + 24. * sin((self.phy_rotation + 90) * pi / 180);

draw_set_alpha(self.current_charge / self.threshold_charge);
draw_sprite(self.energy_sprite, 0, tmp_x, tmp_y);
draw_set_alpha(1);
