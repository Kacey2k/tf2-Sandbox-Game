// Dispensing Logic


switch (currentLevel) {
    case DispenserLevel.One:
        level = 1;
        maxHealth = 150;
        if (levelChanged) {
            alarm[0] = 3600; // Upgrade to Level 2 after 1 minute on level 1.
            levelChanged = false;
        }
        break;

    case DispenserLevel.Two:
        level = 2;
        maxHealth = 180;
		shoot_cooldown = 8;
        if (levelChanged) {
            alarm[1] = 7200; // Upgrade to Level 3 after 2 minutes on level 2.
            levelChanged = false;
        }
        break;

    case DispenserLevel.Three:
        level = 3;
        maxHealth = 216;
        break;
}





var nearest_distance = 50; // Heal range
var nearest_instance = noone;
with (red_flag) { // WHO WE BLASTIN??
    if (id != other.id && object_index != red_dispenser && object_index != red_sentry) { 
        // Exclude self, other dispensers, and sentry guns!!!
        var dist = point_distance(other.x, other.y, x, y);
        if (dist < nearest_distance) {
            nearest_distance = dist;
            nearest_instance = id;
        }
    }
}

if (nearest_instance != noone) 
{
    var potential_heal = nearest_instance;
    var obstruction = collision_line(x, y, potential_heal.x, potential_heal.y, obj_solid, false, true);
    if (obstruction == noone && can_shoot) 
    {
        var healet = instance_create_layer(x, y, "Instances", red_healet);
        healet.owner = owner;

        var target_direction = point_direction(x, y, potential_heal.x, potential_heal.y);
        healet.direction = target_direction;
        healet.speed = healet_speed;

        can_shoot = false;
    }
}



// Cooldown timer
if (!can_shoot) {
    cooldown_timer -= 1;
    if (cooldown_timer <= 0) {
        can_shoot = true;
        cooldown_timer = shoot_cooldown;
    }
}

// Health Leveler
if (currentHealth > maxHealth) { //them rare high moments
	currentHealth = maxHealth;
}

if (isSapped) {
	hp -= 1;
}

if (level = 1) { // Dispenser image set depending on level
	sprite_index = spr_red_dispenser_1;
} else if (level = 2) {
	sprite_index = spr_red_dispenser_2;
} else if (level = 3) {
	sprite_index = spr_red_dispenser_3;
}


if (currentHealth <= 0) {
	//presumably, some debris will go here
	show_debug_message("NPC: " + string(owner) + "'s Dispenser " + " (" + string(id) + ")" + " has been destroyed.")
	
	if instance_exists(creator) {
		creator.dispenserBuilt = false;
	}
	
	instance_destroy();
}