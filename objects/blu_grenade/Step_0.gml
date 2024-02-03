image_angle += spin_speed;

// Exponentially decrease spin_speed
spin_speed *= 0.97;

if (spin_speed < 0.1) { //unnoticable, redundant reduction
    spin_speed = 0;
}

speed /= 1.03;

if (waterFriction = true) { // how to deal with pills in the water
	speed -= 0.01;
		if (speed < 0) {
			speed = 0;
			return;
		}
}

if (place_meeting(x, y, obj_solid)) || (place_meeting(x, y, obj_mesh)) {
    // the uno reversal
    direction = (direction + 180) % 360;
}