function strat_stabbing(){
	if instance_exists(target) && (distance_to_object(target) > detectionDistance) {
		state = SpyState.Roaming; // target out of range
		return;
		
	} else if !instance_exists(target) {
		state = SpyState.Roaming; // target doesnt exist
		return;
		
	} else if (target.object_index = red_sentry) || (target.object_index = red_dispenser) {
		state = SpyState.Roaming; // somehow, our target is a building when we are trying to stab, abort
		return;
		
	} else if (target.isUbered) {
		state = SpyState.Roaming; // our spy is not that dumb
		return;
		
	} else { // what remains must be a human target who is not ubered, and nearby
		
		var obstruction = collision_line(x, y, target.x, target.y, obj_solid, false, true);
		
		if (obstruction == noone) {
			
			var dir = point_direction(x, y, target.x, target.y);
			
			direction = dir;
			speed = spySpeed;
			
			if distance_to_object(target) <= stabbingDistance { // if close enough, begin stab attempts
				
				var stabChance = irandom(100);
				var backstab = false;
				
				var maxStabTime = 60; // 1 second per stab attempt
				var stabTime = maxStabTime;
				
				speed = 0;
				stabTime -= 1;
				
				if stabTime <= 0 {
					
					stabTime = maxStabTime;
					if stabChance >= 90 {
						
						target.hp = 0;
						backstab = true;
					} else {
						
						target.hp -= 25;
						backstab = false;
					}
				}
			}
		} else {
			
			state = SpyState.Roaming; // obstruction detected, abort
			sappingTime = false;
			return;
		}
	}
}