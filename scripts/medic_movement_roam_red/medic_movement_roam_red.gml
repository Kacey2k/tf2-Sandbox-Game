function medic_movement_roam_red() {
	if (moveTimer > 0) {
    moveTimer--;
	} else {
	    moveDirection = irandom(8);
	    moveTimer = moveDuration;
	}
	
	speed = 0;
	
	var best_pocket = undefined;
    var best_pocket_score = -1;
    
    // Who shall we heal?
	// the following code is where medic searches all teammates that exist
	// excluding dispensers, sentries, and themselves.
	// they will then analyze if they are in range, what class they are, and how much hp they have
	// after searching all teammates, medic selects the perfect pocket given the current circumstances they are aware of (hp / avaliable power classes)
    with (red_flag) {
        if (id != other.id && object_index != red_dispenser && object_index != red_sentry) {
            var dist = point_distance(x, y, other.x, other.y);
            if (dist <= other.pocketDetectionRange) {
                var class_priority = getClassPriorityRED(object_index);
                var hp_factor = (maxhp - hp) / maxhp;
                var dist_factor = 1 - (dist / other.pocketDetectionRange);
                var injury_factor = (hp < maxhp) ? 10 : 0;

                // our score will tell him who is the most important pocket nearby to consider healing
				// considering the teammate's hp first, and weighing against their class priority if everyone's healed up
                var pocket_score = class_priority + hp_factor + dist_factor + injury_factor;

                if (pocket_score > best_pocket_score) {
                    best_pocket_score = pocket_score;
                    best_pocket = id;
                }
            }
        }
    }

    if (best_pocket != undefined) {
        pocket = best_pocket;
        state = MedicState.Pocketing;
        return;
    }
	
	// Detection Nodes, imaginary lines that trigger a timer reset if touched
	var newx = 9
	var newy = 9
	
	obstacle1 = instance_nearest(x, y, obj_obstacle_type);
	
	if point_in_rectangle(obstacle1.x, obstacle1.y, x - 5, y -9, x + 5, y + 9) { // Contact Box for SOLIDS
		moveTimer = 0;
		direction = -direction;
	}
	
	if place_meeting(x, y, [obj_solid, obj_noaccess, obj_mesh]) { // Checking DIRECT contact
		moveTimer = 0;
		direction = -direction;
	}
	
	if (pocket = noone) {
		switch (moveDirection) {
			case 0: // Move left
				if collision_line(x, y, x - newx, y, [obj_solid, obj_noaccess, obj_mesh], false, true) {
					moveTimer = 0;
					break;
				} else {
					hspeed = -1;
					vspeed = 0;
					moveDuration = 3;
					break;
				}
			case 1: // Move right
				if collision_line(x, y, x + newx, y, [obj_solid, obj_noaccess, obj_mesh], false, true) {
					moveTimer = 0;
					break;
				} else {
					hspeed = 1;
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
					vspeed = -1;
					moveDuration = 3;
					break;
				}
			case 3: // Move down
			    if collision_line(x, y, x, y + newy, [obj_solid, obj_noaccess, obj_mesh], false, true) {
					moveTimer = 0;
					break;
				} else {
					hspeed = 0;
					vspeed = 1;
					moveDuration = 3;
					break;
				}
			case 4: // diagonal Move up left
				if collision_line(x, y, x - newx, y - newy, [obj_solid, obj_noaccess, obj_mesh], false, true) {
					moveTimer = 0;
					break;
				} else {
					hspeed = -0.5;
					vspeed = -0.5;
					moveDuration += 5;
					break;
				}
			case 5: // diagonal Move down right
				if collision_line(x, y, x + newx, y + newy, [obj_solid, obj_noaccess, obj_mesh], false, true) {
					moveTimer = 0;
					break;
				} else {
					hspeed = 0.5;
					vspeed = 0.5;
					moveDuration += 5;
					break;
				}
			case 6: // diagonal Move up right
				if collision_line(x, y, x + newx, y - newy, [obj_solid, obj_noaccess, obj_mesh], false, true) {
					moveTimer = 0;
					break;
				} else {
					hspeed = 0.5;
					vspeed = -0.5;
					moveDuration += 5;
					break;
				}
			case 7: // diagonal Move down left
				if collision_line(x, y, x - newx, y + newy, [obj_solid, obj_noaccess, obj_mesh], false, true) {
					moveTimer = 0;
					break;
				} else {
					hspeed = -0.5;
					vspeed = 0.5;
					moveDuration += 5;
					break;
				}
			case 8: // STOP Moving
				hspeed = 0;
				vspeed = 0;
				moveDuration = 3;
				break;
		}
	}
}