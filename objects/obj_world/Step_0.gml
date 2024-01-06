if self.flag_game_loaded
{	
	if ((self.cell.density > 100) && (self.flag_gameover != true) && (alarm[3] == -1))
	{
		cell.alarm[3] = 5 * 60;
		alarm[3] = 5 * 60;
	}
}