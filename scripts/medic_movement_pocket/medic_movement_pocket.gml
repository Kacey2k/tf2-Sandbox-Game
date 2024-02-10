function medic_movement_pocket() {
    if (pocket == undefined || pocket == noone) {
        pocket = noone;
        state = MedicState.Alone;
        return;
    }

    var best_pocket = undefined;
    var best_pocket_score = -1;
    
    // Who shall we heal?
	// the following code is where medic searches all teammates that exist
	// excluding dispensers, sentries, and themselves.
	// they will then analyze if they are in range, what class they are, and how much hp they have
	// after searching all teammates, medic selects the perfect pocket given the current circumstances they are aware of (hp / avaliable power classes)
    with (blu_flag) {
        if (id != other.id && object_index != blu_dispenser && object_index != blu_sentry) {
            var dist = point_distance(x, y, other.x, other.y);
            if (dist <= other.pocketDetectionRange) {
                var class_priority = getClassPriority(object_index);
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
    }

    if (instance_exists(pocket) && (pocket != noone) && (point_distance(x, y, pocket.x, pocket.y) <= pocketDetectionRange)) {
        // Check for line of sight obstruction w/ pocket
        var obstruction = collision_line(x, y, pocket.x, pocket.y, obj_solid, false, true);
        if (obstruction == noone) {
			
            speed = 0.7;
			direction = point_direction(x, y, pocket.x, pocket.y);
			
			if (distance_to_object(pocket) <= pocketPersonalSpace) {
				speed = 0;
			}
			
	        if (can_heal) && (distance_to_object(pocket) <= pocketHealRange) {    // heal if cooldown is done
	            var beam = instance_create_layer(x, y, "Instances", heal_beam_blu);
				
				instance_create_layer(x, y, "Effects", heal_flash);
				beam.owner = npc_username;
				beam.creator = id;
				if (isUbered = true) && (distance_to_object(pocket) <= pocketHealRange) {
					beam.canIUberYou = true;
				} else {
					beam.canIUberYou = false;
				}
				
	            var aim_direction = point_direction(x, y, pocket.x, pocket.y);
	            var aim_error = irandom_range(-3, 3);
				
	            beam.direction = aim_direction + aim_error;
	            beam.speed = beam_speed;
				
	            can_heal = false;
	        }
        } else {
            pocket = noone;
            state = MedicState.Alone; // Pocket is in range, but there is an obstruction
            return;
        }
    } else {
        pocket = noone;
        state = MedicState.Alone; // Pocket out of detection range or no longer exists
        return;
    }
}

// This function is how we weigh each class's priority for healing
// Higher values = Higher priority
// Lower values = lower priority
function getClassPriority(class_type) {
    switch (class_type) {
        case blu_heavy: return 7;
        case blu_demo: return 6;
        case blu_soldier: return 5;
        case blu_pyro: return 4;
        case blu_scout: return 3;
		case blu_engie: return 2;
		case blu_medic: return 1;
        default: return 0;
    }
}