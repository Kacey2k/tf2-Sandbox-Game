function scr_movement_combat_pyro_RED(){
	
	var walkTarget = instance_nearest(x, y, blu_flag);
	var walkDirection = point_direction(x, y, walkTarget.x, walkTarget.y)
	
    if (move_cooldown <= 0) {
        combat_move_switch = true;
        move_cooldown = move_cooldown_timer; //reset countdown
		speed = 0.5;
		direction = walkDirection + irandom_range(-3,3);
		
		if (distance_to_object(blu_flag) <= personalSpace) { // Keep bro from trying to merge with enemy
				combat_move_switch = true;
				move_cooldown = move_cooldown_timer; //reset timer and direction
				direction = -walkDirection + irandom_range(-5,5);
		}
    }
	
	if (move_cooldown >= move_cooldown_timer) {
        combat_move_switch = false;
    }

	if (combat_move_switch = false) {
    move_cooldown -= 1;
	}
}