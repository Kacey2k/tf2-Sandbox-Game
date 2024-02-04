function build_dispenser_red() {
    if (!dispenserBuilt) {
        // Place dispenser upon arrival
        var dispenser = instance_create_layer(DispenserTargetX, DispenserTargetY, "Map", red_dispenser);
        dispenser.owner = npc_username;
        mydispenser = dispenser;
		dispenser.creator = id;
        dispenserBuilt = true;
		
		sprite_index = spr_red_engie_bap;
    }

    // WAIT for that thing to fully errect
    dispenserBuildingTimer -= 1;
    if (dispenserBuildingTimer <= 0) {
        dispenserBuildingTimer = dispenserBuildingTimerReset;
        state = EngineerState.Defending;
        buildingPhase = 0; // Next task
    }
}
