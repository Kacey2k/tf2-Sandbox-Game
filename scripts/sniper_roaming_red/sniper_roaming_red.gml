function sniper_roaming_red(){
	
	// Detection Nodes, imaginary lines that trigger a timer reset if touched
	var newx = 9
	var newy = 9
	
	scoped = false;
	
	obstacle1 = instance_nearest(x, y, obj_obstacle_type);
	
	if point_in_rectangle(obstacle1.x, obstacle1.y, x - 5, y -9, x + 5, y +9) { // Contact Box for SOLIDS
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
				hspeed = -0.5;
				vspeed = 0;
				moveDuration = 3;
				break;
			}
	    case 1: // Move right
			if collision_line(x, y, x + newx, y, [obj_solid, obj_noaccess, obj_mesh], false, true) {
				moveTimer = 0;
				break;
			} else {
				hspeed = 0.5;
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
				vspeed = -0.5;
				moveDuration = 3;
				break;
			}
	    case 3: // Move down
	        if collision_line(x, y, x, y + newy, [obj_solid, obj_noaccess, obj_mesh], false, true) {
				moveTimer = 0;
				break;
			} else {
				hspeed = 0;
				vspeed = 0.5;
				moveDuration = 3;
				break;
			}
		case 4: // diagonal Move up left
			if collision_line(x, y, x - newx, y - newy, [obj_solid, obj_noaccess, obj_mesh], false, true) {
				moveTimer = 0;
				break;
			} else {
				hspeed = -0.25;
				vspeed = -0.25;
				moveDuration += 5;
				break;
			}
		case 5: // diagonal Move down right
			if collision_line(x, y, x + newx, y + newy, [obj_solid, obj_noaccess, obj_mesh], false, true) {
				moveTimer = 0;
				break;
			} else {
				hspeed = 0.25;
				vspeed = 0.25;
				moveDuration += 5;
				break;
			}
		case 6: // diagonal Move up right
			if collision_line(x, y, x + newx, y - newy, [obj_solid, obj_noaccess, obj_mesh], false, true) {
				moveTimer = 0;
				break;
			} else {
				hspeed = 0.25;
				vspeed = -0.25;
				moveDuration += 5;
				break;
			}
		case 7: // diagonal Move down left
			if collision_line(x, y, x - newx, y + newy, [obj_solid, obj_noaccess, obj_mesh], false, true) {
				moveTimer = 0;
				break;
			} else {
				hspeed = -0.25;
				vspeed = 0.25;
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