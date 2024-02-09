var cell_size = 10;
global.path_grid = mp_grid_create(0, 0, room_width / cell_size, room_height / cell_size, cell_size, cell_size);
mp_grid_add_instances(global.path_grid, obj_solid, false);
mp_grid_add_instances(global.path_grid, obj_obstacle_type, false);
