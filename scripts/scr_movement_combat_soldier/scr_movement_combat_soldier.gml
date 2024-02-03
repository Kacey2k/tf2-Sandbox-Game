function scr_movement_combat_soldier(){
	// Soldier Combat Speed: 0.3
	// Detection Nodes, imaginary lines that trigger a timer reset if touched
	var newx = 9
	var newy = 9
	
	var obstacle = instance_nearest(x, y, obj_obstacle_type);
	
	if point_in_rectangle(obstacle.x, obstacle.y, x - 5, y -9, x + 5, y +9) { // Contact Box for SOLIDS
		move_cooldown = 0;
	}
	
	if place_meeting(x, y, [obj_solid, obj_noaccess, obj_mesh]) { // Checking DIRECT contact
		move_cooldown = 0;
		direction = -direction;
	}
	
    if (move_cooldown <= 0) {
        combat_move_switch = true;
        move_cooldown = move_cooldown_timer;
		
		switch (combatDirection) {
	    case 0: // Move left
			if collision_line(x, y, x - newx, y, [obj_solid, obj_noaccess, obj_mesh], false, true) {
				move_cooldown = 0;
				break;
			} else {
				hspeed = -0.3;
				vspeed = 0;
				break;
			}
	    case 1: // Move right
			if collision_line(x, y, x + newx, y, [obj_solid, obj_noaccess, obj_mesh], false, true) {
				move_cooldown = 0;
				break;
			} else {
				hspeed = 0.3;
				vspeed = 0;
				break;
			}
	    case 2: // Move up
	        if collision_line(x, y, x, y - newy, [obj_solid, obj_noaccess, obj_mesh], false, true) {
				move_cooldown = 0;
				break;
			} else {
				hspeed = 0;
				vspeed = -0.3;
				break;
			}
	    case 3: // Move down
	        if collision_line(x, y, x, y + newy, [obj_solid, obj_noaccess, obj_mesh], false, true) {
				move_cooldown = 0;
				break;
			} else {
				hspeed = 0;
				vspeed = 0.3;
				break;
			}
		case 4: // diagonal Move up left
			if collision_line(x, y, x - newx, y - newy, [obj_solid, obj_noaccess, obj_mesh], false, true) {
				move_cooldown = 0;
				break;
			} else {
				hspeed = -0.15;
				vspeed = -0.15;
				break;
			}
		case 5: // diagonal Move down right
			if collision_line(x, y, x + newx, y + newy, [obj_solid, obj_noaccess, obj_mesh], false, true) {
				move_cooldown = 0;
				break;
			} else {
				hspeed = 0.15;
				vspeed = 0.15;
				break;
			}
		case 6: // diagonal Move up right
			if collision_line(x, y, x + newx, y - newy, [obj_solid, obj_noaccess, obj_mesh], false, true) {
				move_cooldown = 0;
				break;
			} else {
				hspeed = 0.15;
				vspeed = -0.15;
				break;
			}
		case 7: // diagonal Move down left
			if collision_line(x, y, x - newx, y + newy, [obj_solid, obj_noaccess, obj_mesh], false, true) {
				move_cooldown = 0;
				break;
			} else {
				hspeed = -0.15;
				vspeed = 0.15;
				break;
			}
		case 8: // STOP Moving
			hspeed = 0;
			vspeed = 0;
			break;
		}
    }
	
	if (move_cooldown >= move_cooldown_timer) {
        combat_move_switch = false;
    }

	if (combat_move_switch = false) {
    move_cooldown -= 1;
	}
}