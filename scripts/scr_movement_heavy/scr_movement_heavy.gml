function scr_movement_heavy(){
	
	// Detection Nodes, imaginary lines that trigger a timer reset if touched
	var newx = 11
	var newy = 11
	
	obstacle1 = instance_nearest(x, y, obj_obstacle_type);
	
	if point_in_rectangle(obstacle1.x, obstacle1.y, x - 6, y -10, x + 6, y +10) { // Contact Box for SOLIDS
		moveTimer = 0;
		direction = -direction;
	}
	
	if place_meeting(x, y, [obj_solid, obj_noaccess, obj_mesh]) { // Checking DIRECT contact
		moveTimer = 0;
		direction = -direction;
	}
	
	switch (moveDirection) {
	    case 0: // Move left
			if collision_line(x, y, x - newx, y, [obj_solid, obj_noaccess, obj_mesh], false, true) {
				moveTimer = 0;
				break;
			} else {
				hspeed = -0.3;
				vspeed = 0;
				moveDuration = 3;
				break;
			}
	    case 1: // Move right
			if collision_line(x, y, x + newx, y, [obj_solid, obj_noaccess, obj_mesh], false, true) {
				moveTimer = 0;
				break;
			} else {
				hspeed = 0.3;
				vspeed = 0;
				moveDuration = 3;
				break;
			}
	    case 2: // Move up
	        if collision_line(x, y, x, y - newy, [obj_solid, obj_noaccess, obj_mesh], false, true) {
				moveTimer = 0;
				break;
			} else {
				hspeed = 0;
				vspeed = -0.3;
				moveDuration = 3;
				break;
			}
	    case 3: // Move down
	        if collision_line(x, y, x, y + newy, [obj_solid, obj_noaccess, obj_mesh], false, true) {
				moveTimer = 0;
				break;
			} else {
				hspeed = 0;
				vspeed = 0.3;
				moveDuration = 3;
				break;
			}
		case 4: // diagonal Move up left
			if collision_line(x, y, x - newx, y - newy, [obj_solid, obj_noaccess, obj_mesh], false, true) {
				moveTimer = 0;
				break;
			} else {
				hspeed = -0.15;
				vspeed = -0.15;
				moveDuration += 5;
				break;
			}
		case 5: // diagonal Move down right
			if collision_line(x, y, x + newx, y + newy, [obj_solid, obj_noaccess, obj_mesh], false, true) {
				moveTimer = 0;
				break;
			} else {
				hspeed = 0.15;
				vspeed = 0.15;
				moveDuration += 5;
				break;
			}
		case 6: // diagonal Move up right
			if collision_line(x, y, x + newx, y - newy, [obj_solid, obj_noaccess, obj_mesh], false, true) {
				moveTimer = 0;
				break;
			} else {
				hspeed = 0.15;
				vspeed = -0.15;
				moveDuration += 5;
				break;
			}
		case 7: // diagonal Move down left
			if collision_line(x, y, x - newx, y + newy, [obj_solid, obj_noaccess, obj_mesh], false, true) {
				moveTimer = 0;
				break;
			} else {
				hspeed = -0.15;
				vspeed = 0.15;
				moveDuration += 5;
				break;
			}
		case 8: // STOP Moving
			hspeed = 0;
			vspeed = 0;
			moveDuration = 4;
			break;
	}
}