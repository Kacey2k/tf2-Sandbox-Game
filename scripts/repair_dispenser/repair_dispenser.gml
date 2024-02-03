// WARNING!
// THIS SCRIPT NOW IS LOCATED IN: engie_Movement!
// You are modifying debug code
function repair_dispenser() {
	
	if (mydispenser = noone) {
		buildingPhase = 0;
		state = EngineerState.BuildingSentry;
		return;
	}
	
    // Move towards Dispenser
    direction = point_direction(x, y, mydispenser.x, mydispenser.y);
    if (distance_to_point(mydispenser.x, mydispenser.y) > placeDispenserDistance) {
        speed = 0.5;
		
		// COLLISION DETECTION GOES HERE
    } else {
        // Repairing
        speed = 0;
        repairDispenserTime -= 1;
        if (repairDispenserTime <= 0) {
            repairDispenserTime = repairDispenserTimeReset;
            mydispenser.currentHealth += 25;
        }
    }
}
