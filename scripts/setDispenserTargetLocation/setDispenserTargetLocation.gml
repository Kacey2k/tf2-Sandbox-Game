// Set location for building a dispenser
function setDispenserTargetLocation() {
    var DispenserMaxDistance = 300;
    var locationFound = false;
    var dispenserWidth = 10;
    var dispenserHeight = 10;

    while (!locationFound) {
        var DispenserAngle = random(360);
        DispenserDistance = random(DispenserMaxDistance);

        DispenserTargetX = x + lengthdir_x(DispenserDistance, DispenserAngle);
        DispenserTargetY = y + lengthdir_y(DispenserDistance, DispenserAngle);

        DispenserTargetX = clamp(DispenserTargetX, 0, room_width);
        DispenserTargetY = clamp(DispenserTargetY, 0, room_height);

        if (isLocationClear(DispenserTargetX, DispenserTargetY, dispenserWidth, dispenserHeight)) {
            locationFound = true;
        }
    }
}
