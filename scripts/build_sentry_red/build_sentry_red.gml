function build_sentry_red() {
    if (!sentryBuilt) {
        // Place sentry when arrived
        var sentry = instance_create_layer(SentryTargetX, SentryTargetY, "Environment", red_sentry);
        sentry.owner = npc_username;
        mySentry = sentry;
		sentry.creator = id
        sentryBuilt = true;
		
		sprite_index = spr_red_engie_bap;
    }

    // WAIT for that thing to fully errect
    sentryBuildingTimer -= 1;
    if (sentryBuildingTimer <= 0) {
        sentryBuildingTimer = sentryBuildingTimerReset;
        state = EngineerState.BuildingDispenser;
        buildingPhase = 0; // Next task
    }
}
