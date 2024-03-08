function spy_targeting(){ // Depending on the target, we will choose a different strategy
	
	if instance_exists(target) && (distance_to_object(target) > detectionDistance) {
		state = SpyState.Roaming; // target out of range
		return;
		
	} else if !instance_exists(target) {
		state = SpyState.Roaming; // target doesnt exist
		return;
		
	} else {
		
		var best_target = undefined;
	    var best_target_score = -1;
    
	    with (red_flag) {
	        var dist = point_distance(x, y, other.x, other.y);
				
	        if (dist <= other.detectionDistance) {
	            var target_priority = getClassPrioritySpy(object_index);
	            var dist_factor = 1 - (dist / other.detectionDistance);

	            // our score will tell him who is the most important target nearby to engage
				// considering the enemy's distance & their weighed priority
	            var target_score = target_priority + dist_factor;

	            if (target_score > best_target_score) {
	                best_target_score = target_score;
	                best_target = id;
	            }
	        }
	    }

    
	    if (best_target != undefined) {
	        target = best_target;
			
			if (target.object_index = red_sentry.isSapped = false) || (target.object_index = red_dispenser.isSapped = false) {
				sappingTime = true; // only will choose to sap if.. the building is not already being sapped
				stabbingTime = false;
			} else {
				sappingTime = false;
				stabbingTime = true;
			}
	    }
	}
}

// This function is how we weigh each target's priority for spy
// Higher values = Higher priority
// Lower values = lower priority
function getClassPrioritySpy(target_type) {
    switch (target_type) {
		case red_sentry: return 15;
		case red_dispenser: return 10;
        case red_heavy: return 9;
        case red_engie: return 8;
        case red_medic: return 7;
        case red_soldier: return 6;
        case red_pyro: return 5;
		case red_sniper: return 4;
		case red_demo: return 3;
		//case red_spy: return 2;
		case red_scout: return 1;
        default: return 0;
    }
}