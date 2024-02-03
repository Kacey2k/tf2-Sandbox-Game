// script engie uses to check if he can place his buildings at (x,y) given that no obstacles occupy it.
function isLocationClear(targetX, targetY, objectWidth, objectHeight) {
    var halfWidth = objectWidth / 2;
    var halfHeight = objectHeight / 2;

    for (var checkX = targetX - halfWidth; checkX <= targetX + halfWidth; checkX += halfWidth) {
        for (var checkY = targetY - halfHeight; checkY <= targetY + halfHeight; checkY += halfHeight) {
            if (place_meeting(checkX, checkY, obj_solid) || 
                place_meeting(checkX, checkY, obj_noaccess) || 
                place_meeting(checkX, checkY, obj_mesh)) {
                return false; // Obstruction FOUND!
            }
        }
    }
    return true; // Location is Clear
}
