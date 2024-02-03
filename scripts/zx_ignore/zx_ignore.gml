// Old roaming loop, left in for reference
// Note: no collision detection
function scr_roam_around() {
    if (moveTimer <= 0) {
        moveDirection = irandom(8);
        moveTimer = moveDuration;
    } else {
        moveTimer--;
    }

    switch (moveDirection) {
		    case 0: // Move left
		        hspeed = -0.5;
		        vspeed = 0;
				moveDuration = 2;
		        break;
		    case 1: // Move right
		        hspeed = 0.5;
		        vspeed = 0;
				moveDuration = 2;
		        break;
		    case 2: // Move up
		        hspeed = 0;
		        vspeed = -0.5;
				moveDuration += 2;
		        break;
		    case 3: // Move down
		        hspeed = 0;
		        vspeed = 0.5;
				moveDuration += 1;
		        break;
			case 4: // diagonal Move up left
				hspeed = -0.25;
				vspeed = -0.25;
				moveDuration += 1;
				break;
			case 5: // diagonal Move down right
				hspeed = 0.25;
				vspeed = 0.25;
				moveDuration += 1;
				break;
			case 6: // diagonal Move up right
				hspeed = 0.25;
				vspeed = -0.25;
				moveDuration += 1;
				break;
			case 7: // diagonal Move down left
				hspeed = -0.25;
				vspeed = 0.25;
				moveDuration += 1;
				break;
			case 8: // STOP Moving
				hspeed = 0;
				vspeed = 0;
				moveDuration = 4;
				break;
	}
	
}