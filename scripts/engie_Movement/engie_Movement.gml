// This is the main (well, default) movement of Engie after he builds his buildings for the first time.
// In here youll find the natural movement and collision detection loop, and some scripts that send him back to different states if a building dies or gets DMGd
function engie_Movement(){

	if (mySentry = noone) {
		buildingPhase = 0;
		state = EngineerState.BuildingSentry;
		return;
	} else if (mydispenser = noone) {
		buildingPhase = 0;
		state = EngineerState.BuildingDispenser;
		return;
    } else {
				// sentry repairing script
	if (mySentry != noone && mySentry.currentHealth < mySentry.maxHealth) {
	    
		speed = 0.5;
		direction = point_direction(x, y, mySentry.x, mySentry.y); // walking to sentry
		
		if (distance_to_point(mySentry.x, mySentry.y) <= placeSentryDistance) { // arriving at damaged sentry
			speed = 0
			
			
			repairSentryTime -= 1;
			
			if repairSentryTime <= 0 { // each swing = +hp
				repairSentryTime = repairSentryTimeReset
				canRepairSentry = true;
				mySentry.currentHealth += 25;
				
			}
			
		}
		
	} else if (mydispenser != noone && mydispenser.currentHealth < mydispenser.maxHealth) { // Repair Despenser script
	    
		speed = 0.5;
		direction = point_direction(x, y, mydispenser.x, mydispenser.y); // walking to dispenser
		
		if (distance_to_point(mydispenser.x, mydispenser.y) <= placeDispenserDistance) { // arriving at damaged dispenser
			speed = 0
			
			
			repairDispenserTime -= 1;
			
			if repairDispenserTime <= 0 { // each swing = +hp
				repairDispenserTime = repairDispenserTimeReset
				canRepairDispenser = true;
				mydispenser.currentHealth += 25;
				
			}
			
		}
		
	} else if (mydispenser.currentHealth = mydispenser.maxHealth) && (mySentry.currentHealth = mySentry.maxHealth) {
		
			// Node Lengths
			var newx = 9
			var newy = 9
	
			obstacle1 = instance_nearest(x, y, obj_obstacle_type);
			//obstacle2 = instance_nearest(x, y, obj_noaccess);
			//obstacle3 = instance_nearest(x, y, obj_mesh);
	
			if point_in_rectangle(obstacle1.x, obstacle1.y, x - 5, y -9, x + 5, y +9) { // Contact Box for SOLIDS
				moveTimer = 0;
				direction = -direction;
			}
	
			if place_meeting(x, y, [obj_solid, obj_noaccess, obj_mesh]) { // Checking DIRECT contact
				moveTimer = 0;
				direction = -direction;
			}
	
			switch (moveDirection) {
			    case 0: // Move left
					if collision_line(x, y, x - newx, y, [obj_solid, obj_noaccess, obj_mesh], false, true) {
						moveTimer = 0;
						break;
					} else {
						hspeed = -0.5;
						vspeed = 0;
						moveDuration = 3;
						break;
					}
			    case 1: // Move right
					if collision_line(x, y, x + newx, y, [obj_solid, obj_noaccess, obj_mesh], false, true) {
						moveTimer = 0;
						break;
					} else {
						hspeed = 0.5;
						vspeed = 0;
						moveDuration = 3;
						break;
					}
			    case 2: // Move up
			        if collision_line(x, y, x, y - newy, [obj_solid, obj_noaccess, obj_mesh], false, true) {
						moveTimer = 0;
						break;
					} else {
						hspeed = 0;
						vspeed = -0.5;
						moveDuration = 3;
						break;
					}
			    case 3: // Move down
			        if collision_line(x, y, x, y + newy, [obj_solid, obj_noaccess, obj_mesh], false, true) {
						moveTimer = 0;
						break;
					} else {
						hspeed = 0;
						vspeed = 0.5;
						moveDuration = 3;
						break;
					}
				case 4: // diagonal Move up left
					if collision_line(x, y, x - newx, y - newy, [obj_solid, obj_noaccess, obj_mesh], false, true) {
						moveTimer = 0;
						break;
					} else {
						hspeed = -0.25;
						vspeed = -0.25;
						moveDuration += 5;
						break;
					}
				case 5: // diagonal Move down right
					if collision_line(x, y, x + newx, y + newy, [obj_solid, obj_noaccess, obj_mesh], false, true) {
						moveTimer = 0;
						break;
					} else {
						hspeed = 0.25;
						vspeed = 0.25;
						moveDuration += 5;
						break;
					}
				case 6: // diagonal Move up right
					if collision_line(x, y, x + newx, y - newy, [obj_solid, obj_noaccess, obj_mesh], false, true) {
						moveTimer = 0;
						break;
					} else {
						hspeed = 0.25;
						vspeed = -0.25;
						moveDuration += 5;
						break;
					}
				case 7: // diagonal Move down left
					if collision_line(x, y, x - newx, y + newy, [obj_solid, obj_noaccess, obj_mesh], false, true) {
						moveTimer = 0;
						break;
					} else {
						hspeed = -0.25;
						vspeed = 0.25;
						moveDuration += 5;
						break;
					}
				case 8: // STOP Moving
					hspeed = 0;
					vspeed = 0;
					moveDuration = 4;
					break;
			}
		}
	}
}