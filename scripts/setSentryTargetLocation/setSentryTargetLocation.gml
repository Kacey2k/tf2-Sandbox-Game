// Set target location for building a sentry - homie doesnt use wall hax to place buildings anymore
function setSentryTargetLocation() {
    var SentryMaxDistance = 300;
    var locationFound = false;
    var sentryWidth = 10;
    var sentryHeight = 10;

    while (!locationFound) {
        var SentryAngle = random(360);
        SentryDistance = random(SentryMaxDistance);

        SentryTargetX = x + lengthdir_x(SentryDistance, SentryAngle);
        SentryTargetY = y + lengthdir_y(SentryDistance, SentryAngle);

        SentryTargetX = clamp(SentryTargetX, 0, room_width);
        SentryTargetY = clamp(SentryTargetY, 0, room_height);

        if (isLocationClear(SentryTargetX, SentryTargetY, sentryWidth, sentryHeight) &&
            collision_line(x, y, SentryTargetX, SentryTargetY, obj_solid, false, true) == noone &&
            collision_line(x, y, SentryTargetX, SentryTargetY, obj_noaccess, false, true) == noone &&
            collision_line(x, y, SentryTargetX, SentryTargetY, obj_mesh, false, true) == noone) {
            locationFound = true;
        }
    }
}
