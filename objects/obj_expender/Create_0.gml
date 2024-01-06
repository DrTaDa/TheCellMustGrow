event_inherited();

cell = instance_find(obj_player_cell, 0);

has_capturer = true;
range = 70;

angle_capturer = 45
dist_capturer = 30;

instantiate_capturer();

type_obj_passing = obj_block_blue;
capturer.target_type = obj_energy;
capturer.duration_use = 5; //sec

entrance_distance = 40;
exit_distance = 45;
entrance_angle = 90;
exit_angle = 0;