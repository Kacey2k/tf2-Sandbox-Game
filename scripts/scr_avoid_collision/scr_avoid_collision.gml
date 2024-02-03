// simple script for detecting collisions
// Returns True when no collision
// Returns False when collision

function scr_avoid_collision() {
    var new_x = x;
    var new_y = y;

    if (place_meeting(new_x, new_y, obj_solid)) {
        // Collision detected!
        return false;
    }
	
	if (place_meeting(new_x, new_y, obj_mesh)) {
        // Collision detected!
        return false;
    }
	
	if (place_meeting(new_x, new_y, obj_noaccess)) {
        // Collision detected!
        return false;
    }

    // No collision detected
    return true;
}
