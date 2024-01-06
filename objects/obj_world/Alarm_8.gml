/// @description World creation / instantiation
// You can write your code in this editor

instance_create_layer(0, 0, "lay_UI", obj_UI_game_speed);

for (var i = 0; i < self.n_molecule_block1; i += 1)
{
    spawn_molecule_random_position(obj_block_blue, "lay_blocks");
}

for (var i = 0; i < self.n_molecule_block2; i += 1)
{
    spawn_molecule_random_position(obj_block_green, "lay_blocks");
}

for (var i = 0; i < self.n_molecule_block3; i += 1)
{
    spawn_molecule_random_position(obj_block_orange, "lay_blocks");
}

for (var i = 0; i < self.n_molecule_energy; i += 1)
{
    spawn_molecule_random_position(obj_energy, "lay_blocks");
}

//CREATE THE CELL
self.cell = instance_create_layer(self.spawn_x_offset, self.spawn_y_offset, "lay_blocks", obj_player_cell);

self.UI = instance_create_layer(0, 0, "lay_membrane", obj_UI);
self.camera_target = instance_create_layer(0, 0, "lay_membrane", obj_camera);
self.camera = instance_create_layer(0, 0, "lay_membrane", obj_camera_target);

self.flag_game_loaded = true;