function sniper_escaping_red(){
	
	scoped = false;
	
	var target = instance_nearest(x, y, blu_flag);
	
	if (instance_exists(target)) && (target != noone) && (distance_to_object(target) <= escapeDistance) {
		
		var obstruction = collision_line(x, y, target.x, target.y, obj_solid, false, true);
		if (obstruction == noone) {
			
			if (can_shoot_SMG) {
	            var bullet = instance_create_layer(x, y, "Instances", obj_bullet_red);
				bullet.owner = npc_username;
			
	            instance_create_layer(x, y, "Effects", wep_flash);
            
	            var aim_direction = point_direction(x, y, target.x, target.y);
	            var aim_error = irandom_range(-1, 1);
			
	            bullet.direction = aim_direction + aim_error;
	            bullet.speed = bullet_speed_SMG;
            
	            can_shoot_SMG = false;
			}
			
			if place_meeting(x, y, obj_obstacle_type) {
				speed = 0;
			} else {
				if target.speed > 0 {
					speed = 0.5;
					direction = -target.direction;
				} else {
					var targetDist = distance_to_point(target.x, target.y)
					speed = 0.5;
					direction = -targetDist;
				}
			}
			
		} else {
			state = SniperState.Roaming;
			return;
		}
	}
}