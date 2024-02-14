function sniper_scoped(){
	
	var target = instance_nearest(x, y, red_flag);
	
	if (target != noone && point_distance(x, y, target.x, target.y) <= detectionDistance) {
	    var obstruction = collision_line(x, y, target.x, target.y, obj_solid, false, true);
	    if (obstruction == noone) {
			
			speed = 0;

	        if (can_shoot) {
	            var bullet = instance_create_layer(x, y, "Instances", obj_bullet_blu);
				bullet.owner = npc_username;
			
	            instance_create_layer(x, y, "Effects", wep_flash);
            
	            var aim_direction = point_direction(x, y, target.x, target.y);
	            var aim_error = irandom_range(-1, 1);
			
	            bullet.direction = aim_direction + aim_error;
	            bullet.speed = bullet_speed;
            
	            can_shoot = false;
			}
        } else {
			state = SniperState.Roaming;
			return;
		}
	} else {
		state = SniperState.Roaming;
		return;
	}
}