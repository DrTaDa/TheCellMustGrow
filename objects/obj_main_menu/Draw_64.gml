draw_text_sharp(self.center_x, self.center_y - 250, self.game_title, 110, 0);

draw_set_alpha(0.3 * (1 + sin(current_time / 400)));
draw_text_sharp(self.center_x, self.center_y + 350, "Click anywhere to start ...", 60, 0);
draw_set_alpha(1);