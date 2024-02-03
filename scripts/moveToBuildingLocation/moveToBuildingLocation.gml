// Script only ran when building a new building. Repairing scripts found in: engie_Movement
function moveToBuildingLocation() {
    var targetX, targetY;

    // target set based on current state
    if (state == EngineerState.BuildingSentry) {
        targetX = SentryTargetX;
        targetY = SentryTargetY;
    } else if (state == EngineerState.BuildingDispenser) {
        targetX = DispenserTargetX;
        targetY = DispenserTargetY;
    } else {
        // Invalid
        return;
    }

    // Move towards the target location
    direction = point_direction(x, y, targetX, targetY);
    if (distance_to_point(targetX, targetY) > placeSentryDistance) {
        speed = 0.5;
		
		// TODO: Presumably, new, streamlined, epic collision detection will go here
    } else {
        speed = 0;
        buildingPhase = 2; // Switch to building phase
    }
}
