// For heavies: Cooldown does not apply, will revise later
function scr_movement_combat_heavy(){
	
	var walkTarget = instance_nearest(x, y, red_flag);
	var walkDirection = point_direction(x, y, walkTarget.x, walkTarget.y)
	
    if (move_cooldown <= 0) {
        combat_move_switch = true;
        move_cooldown = move_cooldown_timer; //reset countdown
		speed = 0.2;
		direction = walkDirection + irandom_range(-3,3);
		
		if (distance_to_object(red_flag) <= personalSpace) { // Keep bro from trying to merge with enemy
			combat_move_switch = true;
			move_cooldown = move_cooldown_timer;
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