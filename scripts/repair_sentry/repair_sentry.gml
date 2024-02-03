// WARNING!
// THIS SCRIPT NOW IS LOCATED IN: engie_Movement!
// You are modifying debug code
function repair_sentry() {
	// Check for if sentry dies while approaching
	if (mySentry = noone) {
		buildingPhase = 0;
		state = EngineerState.BuildingSentry;
		return;
	}
	
    // Move towards Sentry
    direction = point_direction(x, y, mySentry.x, mySentry.y);
    if (distance_to_point(mySentry.x, mySentry.y) > placeSentryDistance) {
        speed = 0.5;
		
		if (mySentry = noone) { // If sentry dies after walking
		buildingPhase = 0;
		state = EngineerState.BuildingSentry;
		return;
	}
	
	
    } else {
        // Repairing
        speed = 0;
        repairSentryTime -= 1;
        if (repairSentryTime <= 0) {
            repairSentryTime = repairSentryTimeReset;
            mySentry.currentHealth += 25;
        }
    }
}
