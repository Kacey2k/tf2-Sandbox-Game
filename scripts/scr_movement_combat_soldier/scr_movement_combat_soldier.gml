function scr_movement_combat_soldier(){
	
    if (move_cooldown <= 0) {
        combat_move_switch = true;
        move_cooldown = move_cooldown_timer;
		switch (combatDirection) {
			case 0: //up
				hspeed = 0;
				vspeed = 0.3;
				break;
			case 1: //down
				hspeed = 0;
				vspeed = -0.3;
				break;
			case 2: //left
				hspeed = -0.3;
				vspeed = 0;
				break;
			case 3: //right
				hspeed = 0.3;
				vspeed = 0;
				break;
			case 4: //stop
				hspeed = 0;
				vspeed = 0;
				break;
		}
    }
	
	if (move_cooldown >= move_cooldown_timer) {
        combat_move_switch = false;
    }

	if (combat_move_switch = false) {
    move_cooldown -= 1;
	}
}