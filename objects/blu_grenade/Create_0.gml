global.countProjectiles += 1;
alarm_set(0, 200); // Explode after this amount of time
owner = "";

image_angle = irandom_range(1, 360); // ran spin start
spin_speed = 30; // start speed

waterFriction = false;