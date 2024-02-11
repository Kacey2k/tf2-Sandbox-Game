var bluObjects = [blu_scout, blu_soldier, blu_pyro, blu_demo, blu_heavy, blu_engie, blu_sentry_1, blu_sentry, blu_dispenser, blu_medic];
var redObjects = [red_scout, red_soldier, red_pyro, red_demo, red_heavy, red_engie, red_sentry_1, red_sentry, red_dispenser];

// Destroy all instances of blue objects
for (var i = 0; i < array_length_1d(bluObjects); i++) {
    with (bluObjects[i]) {
        instance_destroy();
    }
}

// Destroy all instances of red objects
for (var i = 0; i < array_length_1d(redObjects); i++) {
    with (redObjects[i]) {
        instance_destroy();
    }
}

global.playersConnected = 0;