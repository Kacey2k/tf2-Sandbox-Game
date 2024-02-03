// Script only ran when building a new building. Repairing scripts found in: engie_Movement
function moveToBuildingLocation() {
    var targetX, targetY;

    // target set based on current state
    if (state == EngineerState.BuildingSentry) {
        targetX = SentryTargetX;
        targetY = SentryTargetY;
    } else if (state == EngineerState.BuildingDispenser) {
        targetX = DispenserTargetX;
        targetY = DispenserTargetY;
    } else {
        // Invalid
        return;
    }

    // Move towards the target location
	
    if (distance_to_point(targetX, targetY) > placeSentryDistance) {
		
		var newx = 9;
		var newy = 9;
		
		var obstacle = instance_nearest(x, y, obj_obstacle_type);
		
		if point_in_rectangle(obstacle.x, obstacle.y, x - 10, y - 10, x + 10, y + 10) { // Contact Box for SOLIDS
		
		//moveDirection = 0;
		
			switch (moveDirection) {
			    case 0: // Move left
					if collision_line(x, y, x - newx, y, [obj_solid, obj_noaccess, obj_mesh], false, true) {
						moveDirection = 1;
						speed = 0;
						break;
					} else {
						speed = 0.5;
						direction = point_direction(x, y, targetX, targetY);
						break;
					}
			    case 1: // Move right
					if collision_line(x, y, x + newx, y, [obj_solid, obj_noaccess, obj_mesh], false, true) {
						moveDirection = 2;
						speed = 0;
						break;
					} else {
						speed = 0.5;
						direction = point_direction(x, y, targetX, targetY);
						break;
					}
			    case 2: // Move up
			        if collision_line(x, y, x, y - newy, [obj_solid, obj_noaccess, obj_mesh], false, true) {
						moveDirection = 3;
						speed = 0;
						break;
					} else {
						speed = 0.5;
						direction = point_direction(x, y, targetX, targetY);
						break;
					}
			    case 3: // Move down
			        if collision_line(x, y, x, y + newy, [obj_solid, obj_noaccess, obj_mesh], false, true) {
						moveDirection = 4;
						speed = 0;
						break;
					} else {
						speed = 0.5;
						direction = point_direction(x, y, targetX, targetY);
						break;
					}
				case 4: // diagonal Move up left
					if collision_line(x, y, x - newx, y - newy, [obj_solid, obj_noaccess, obj_mesh], false, true) {
						moveDirection = 5;
						speed = 0;
						break;
					} else {
						speed = 0.5;
						direction = point_direction(x, y, targetX, targetY);
						break;
					}
				case 5: // diagonal Move down right
					if collision_line(x, y, x + newx, y + newy, [obj_solid, obj_noaccess, obj_mesh], false, true) {
						moveDirection = 6;
						speed = 0;
						break;
					} else {
						speed = 0.5;
						direction = point_direction(x, y, targetX, targetY);
						break;
					}
				case 6: // diagonal Move up right
					if collision_line(x, y, x + newx, y - newy, [obj_solid, obj_noaccess, obj_mesh], false, true) {
						moveDirection = 7;
						speed = 0;
						break;
					} else {
						speed = 0.5;
						direction = point_direction(x, y, targetX, targetY);
						break;
					}
				case 7: // diagonal Move down left
					if collision_line(x, y, x - newx, y + newy, [obj_solid, obj_noaccess, obj_mesh], false, true) {
						moveDirection = 0;
						speed = 0;
						break;
					} else {
						speed = 0.5;
						direction = point_direction(x, y, targetX, targetY);
						break;
					}
			}
		} else {
			speed = 0.5;
			direction = point_direction(x, y, targetX, targetY);
			//moveDirection = -1;
		}
		
    } else {
        speed = 0;
        buildingPhase = 2; // Switch to building phase
    }
}