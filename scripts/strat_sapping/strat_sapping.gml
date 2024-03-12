function strat_sapping(){
	if instance_exists(target) && (distance_to_object(target) > detectionDistance) {
		state = SpyState.Roaming; // target out of range
		return;
		
	} else if !instance_exists(target) {
		state = SpyState.Roaming; // target doesnt exist
		return;
		
	} else if (target.object_index != red_sentry) || (target.object_index != red_dispenser) {
		state = SpyState.Roaming; // somehow, our target is no longer a building, abort
		return;
		
	} else {
		
		var obstruction = collision_line(x, y, target.x, target.y, obj_solid, false, true);
		
		if (obstruction == noone) {
			
			var dir = point_direction(x, y, target.x, target.y);
			
			direction = dir;
			speed = spySpeed;
			
			if distance_to_object(target) <= sappingDistance {
				
				speed = 0;
				
				target.isSapped = true;
				
				state = SpyState.Roaming;
				return;
			}
		} else {
			
			state = SpyState.Roaming; // obstruction detected, abort
			sappingTime = false;
			return;
		}
	}
}