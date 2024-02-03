// Script only ran when building a new building. Repairing scripts found in: engie_Movement
// ETERNAL PAIN ENGIE EDITION ;-; ;-; ;-; ;-; ;-; ;-; ;-; ;-;
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
		
		var distanceRemaining = lengthdir_x(x, targetX) + lengthdir_y(y, targetY); // used to set amount of time engie walks a free direction
		
		if point_in_rectangle(obstacle.x, obstacle.y, x - 10, y - 10, x + 10, y + 10) { // Contact Box for SOLIDS
			
		
			if (moveTimer > 0) {
			    moveTimer--;
			} else {
			    // Randomly choose a new direction when the timer runs out
			    moveDirection = 0;
			    moveTimer = moveDuration;
			}
		
				switch (moveDirection) {
				    case 0: // Move left
						if collision_line(x, y, x - newx, y, [obj_solid, obj_noaccess, obj_mesh], false, true) {
							moveDirection = 1;
							speed = 0;
							break;
						} else { // can move left
							moveDuration = distanceRemaining;
							speed = 0.5;
							direction = point_direction(x, y, x - newx, y);
							
							if point_in_rectangle(obstacle.x, obstacle.y, x - 5, y - 5, x + 5, y + 5) {
								moveDirection = 1;
								break;
							}
							break;
						}
				    case 1: // Move right
						if collision_line(x, y, x + newx, y, [obj_solid, obj_noaccess, obj_mesh], false, true) {
							moveDirection = 2;
							speed = 0;
							break;
						} else { // can move right
							moveDuration = distanceRemaining;
							speed = 0.5;
							direction = point_direction(x, y, x + newx, y);
							if point_in_rectangle(obstacle.x, obstacle.y, x - 5, y - 5, x + 5, y + 5) {
								moveDirection = 2;
								break;
							}
							break;
						}
				    case 2: // Move up
				        if collision_line(x, y, x, y - newy, [obj_solid, obj_noaccess, obj_mesh], false, true) {
							moveDirection = 3;
							speed = 0;
							break;
						} else { // can move up
							moveDuration = distanceRemaining;
							speed = 0.5;
							direction = point_direction(x, y, x, y - newy);
							if point_in_rectangle(obstacle.x, obstacle.y, x - 5, y - 5, x + 5, y + 5) {
								moveDirection = 3;
								break;
							}
							break;
						}
				    case 3: // Move down
				        if collision_line(x, y, x, y + newy, [obj_solid, obj_noaccess, obj_mesh], false, true) {
							moveDirection = 4;
							speed = 0;
							break;
						} else { // can move down
							moveDuration = distanceRemaining;
							speed = 0.5;
							direction = point_direction(x, y, x, y + newy);
							if point_in_rectangle(obstacle.x, obstacle.y, x - 5, y - 5, x + 5, y + 5) {
								moveDirection = 4;
								break;
							}
							break;
						}
					case 4: // diagonal Move up left
						if collision_line(x, y, x - newx, y - newy, [obj_solid, obj_noaccess, obj_mesh], false, true) {
							moveDirection = 5;
							speed = 0;
							break;
						} else { // can move up left
							moveDuration = distanceRemaining;
							speed = 0.5;
							direction = point_direction(x, y, x - newx, y - newy);
							if point_in_rectangle(obstacle.x, obstacle.y, x - 5, y - 5, x + 5, y + 5) {
								moveDirection = 5;
								break;
							}
							break;
						}
					case 5: // diagonal Move down right
						if collision_line(x, y, x + newx, y + newy, [obj_solid, obj_noaccess, obj_mesh], false, true) {
							moveDirection = 6;
							speed = 0;
							break;
						} else { // can move down right
							moveDuration = distanceRemaining;
							speed = 0.5;
							direction = point_direction(x, y, x + newx, y + newy);
							if point_in_rectangle(obstacle.x, obstacle.y, x - 5, y - 5, x + 5, y + 5) {
								moveDirection = 6;
								break;
							}
							break;
						}
					case 6: // diagonal Move up right
						if collision_line(x, y, x + newx, y - newy, [obj_solid, obj_noaccess, obj_mesh], false, true) {
							moveDirection = 7;
							speed = 0;
							break;
						} else { // can move up right
							moveDuration = distanceRemaining;
							speed = 0.5;
							direction = point_direction(x, y, x + newx, y - newy);
							if point_in_rectangle(obstacle.x, obstacle.y, x - 5, y - 5, x + 5, y + 5) {
								moveDirection = 7;
								break;
							}
							break;
						}
					case 7: // diagonal Move down left
						if collision_line(x, y, x - newx, y + newy, [obj_solid, obj_noaccess, obj_mesh], false, true) {
							moveDirection = 0;
							speed = 0;
							break;
						} else { // can move down left
							moveDuration = distanceRemaining;
							speed = 0.5;
							direction = point_direction(x, y, x - newx, y + newy);
							if point_in_rectangle(obstacle.x, obstacle.y, x - 5, y - 5, x + 5, y + 5) {
								moveDirection = 0;
								break;
							}
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