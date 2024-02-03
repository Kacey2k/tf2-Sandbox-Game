// Sentry Gun Logic

switch (currentLevel) {
    case SentryLevel.One:
        level = 1;
        maxHealth = 150;
        if (levelChanged) {
            alarm[0] = 3600; // Upgrade to Level 2 after 1 minute on level 1.
            levelChanged = false;
        }
        break;

    case SentryLevel.Two:
        level = 2;
        maxHealth = 180;
		shoot_cooldown = 8;
        if (levelChanged) {
            alarm[1] = 7200; // Upgrade to Level 3 after 2 minutes on level 2.
            levelChanged = false;
        }
        break;

    case SentryLevel.Three:
        level = 3;
        maxHealth = 216;
		rocket_unlock = true;
        break;
}





var scan_range = 45; // 90 degrees total. 45 each side from the right
var potential_target = instance_nearest(x, y, red_flag);
if (instance_exists(potential_target) && point_distance(x, y, potential_target.x, potential_target.y) <= 150)
{
    // If a target is present, check if obstruction
	var obstruction = collision_line(x, y, potential_target.x, potential_target.y, obj_solid, false, true);
	if obstruction = noone {
		
	    current_target = potential_target;
	    turret_state = "targeting";
	    turret.image_angle = point_direction(x, y, current_target.x, current_target.y);
		if (can_shoot) {
	            var bullet = instance_create_layer(x, y, "Instances", obj_bullet_blu);
				bullet.owner = owner;
			
	            instance_create_layer(x, y, "Instances", wep_flash);
            
	            var aim_direction = point_direction(x, y, current_target.x, current_target.y);
	            var aim_error = irandom_range(-2, 2);
			
	            bullet.direction = aim_direction + aim_error;
	            bullet.speed = bullet_speed;
            
	            can_shoot = false;
		}
	}
}
else if (turret_state == "targeting")
{
    // If transitioning from targeting to scanning, reset to start of scanning range
    turret.image_angle = -scan_range;
    turret.scan_direction = 1;
    turret_state = "scanning";
}

// Scanning logic
if (turret_state == "scanning")
{
    // Scanning motion within a range of 90 degrees
    turret.image_angle += turret.scan_speed * turret.scan_direction;
    if (turret.image_angle > scan_range || turret.image_angle < -scan_range)
    {
        turret.scan_direction *= -1; // Change direction at the ends of a scan
    }
}


if (currentHealth > maxHealth) { // for those rare high moments
	currentHealth = maxHealth;
}

// Cooldown logic
if (!can_shoot) {
    cooldown_timer -= 1;
    if (cooldown_timer <= 0) {
        can_shoot = true;
        cooldown_timer = shoot_cooldown;
    }
}

if (isSapped) {
	hp -= 1;
}

if (currentHealth <= 0) {
	//presumably, some debris will go here.
	show_debug_message("NPC: " + string(owner) + "'s Sentry " + " (" + string(id) + ")" + " has been destroyed.")
	instance_destroy(turret);
	
	if instance_exists(creator) {
		creator.sentryBuilt = false;
	}
	instance_destroy();
}