has_capturer = false;
capturer = 0;
traversing_molecule_id = noone;
traversing_molecule_id2 = noone;
tip_channel_x = -1;
tip_channel_y = -1;
exit_channel_x = -1;
exit_channel_y = -1;
dist_capturer = 0;

event_inherited();

type_obj_passing = noone;

entrance_distance = 40;
exit_distance = 45;
entrance_angle = -90;
exit_angle = 90;

threshold_charge = 30;
current_charge = 0;

energy_sprite = asset_get_index("spr_energy");