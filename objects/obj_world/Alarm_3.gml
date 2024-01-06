self.flag_gameover = true;
cell.flag_gameover = true;

var tmp_UI = instance_find(obj_UI, 0);
if  tmp_UI != noone
{
	instance_destroy(tmp_UI);
}

self.alarm[4] = 30 * 60;