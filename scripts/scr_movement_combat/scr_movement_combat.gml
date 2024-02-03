function scr_movement_combat(){
	
    if (move_cooldown <= 0) {
        combat_move_switch = true;
        move_cooldown = move_cooldown_timer;
		switch (combatDirection) { //movement simulated during combat
			case 0: //up
				hspeed = 0;
				vspeed = 0.5;
				break;
			case 1: //down
				hspeed = 0;
				vspeed = -0.5;
				break;
			case 2: //left
				hspeed = -0.5;
				vspeed = 0;
				break;
			case 3: //right
				hspeed = 0.5;
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