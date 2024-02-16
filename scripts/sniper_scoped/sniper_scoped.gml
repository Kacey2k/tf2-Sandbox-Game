function sniper_scoped(){
	
	var target = instance_nearest(x, y, red_flag);
	
	if (target != noone && point_distance(x, y, target.x, target.y) <= detectionDistance) {
	    var obstruction = collision_line(x, y, target.x, target.y, obj_solid, false, true);
	    if (obstruction == noone) {
			
			speed = 0;
			scoped = true;
			
			var newx = 9;
			var newy = 9;
			
			switch (scopedMoveDirection) {
				case 0:
					if collision_line(x, y, x + newx, y, [obj_solid, obj_noaccess, obj_mesh], false, true) {
						scopedMoveTimer = 0;
						break;
					} else {
						hspeed = 0.2;
						vspeed = 0;
						break;
					}
				case 1:
					if collision_line(x, y, x - newx, y, [obj_solid, obj_noaccess, obj_mesh], false, true) {
						scopedMoveTimer = 0;
						break;
					} else {
						hspeed = -0.2;
						vspeed = 0;
						break;
					}
				case 2:
					if collision_line(x, y, x, y + newy, [obj_solid, obj_noaccess, obj_mesh], false, true) {
						scopedMoveTimer = 0;
						break;
					} else {
						hspeed = 0;
						vspeed = 0.2;
						break;
					}
				case 3:
					if collision_line(x, y, x, y - newy, [obj_solid, obj_noaccess, obj_mesh], false, true) {
						scopedMoveTimer = 0;
						break;
					} else {
						hspeed = 0;
						vspeed = -0.2;
						break;
					}
				case 4:
					speed = 0;
					break;
				case 5:
					speed = 0;
					break;
			}

	        if (can_shoot) {
	            var bullet = instance_create_layer(x, y, "Instances", obj_bullet_blu);
				bullet.owner = npc_username;
			
	            instance_create_layer(x, y, "Effects", wep_flash);
				sound_sniper_fire();
            
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