if (moveTimer > 0) {
    moveTimer--;
} else {
    // Randomly choose a new direction when the timer runs out
    moveDirection = irandom(8);
    moveTimer = moveDuration;
}


//                          Core Movement & Combat Loop


//									Killer Logic (get it?)



var damageCheck = noone;
var nearestDistance = -1;
var objectsToCheck = [obj_bullet_red, red_rocket, red_fire];

// Iterate through the array of objects
for (var i = 0; i < array_length_1d(objectsToCheck); i++) {
    var objId = objectsToCheck[i];
    var instance = instance_nearest(x, y, objId);
    
    if (instance != noone) {
        var distance = point_distance(x, y, instance.x, instance.y);
        if (nearestDistance == -1 || distance < nearestDistance) {
            damageCheck = instance;
            nearestDistance = distance;
        }
    }
}

var lastAddedOwner = ds_list_find_value(wepOwnersList, ds_list_size(wepOwnersList) - 1);

if (damageCheck != noone && nearestDistance <= damage_range) {
    if (variable_instance_exists(damageCheck, "owner")) {
        ds_list_add(wepOwnersList, damageCheck.owner);
    }
}




var target = instance_nearest(x, y, red_flag);

if (target != noone && point_distance(x, y, target.x, target.y) <= shooting_range) {
    // Check for line of sight obstruction
    var obstruction = collision_line(x, y, target.x, target.y, obj_solid, false, true);
    if (obstruction == noone) {
        combatDirection = irandom(4);
        scr_movement_combat_soldier();

        if (can_shoot) {    // Shoot if cooldown is done
            var bullet = instance_create_layer(x, y, "Instances", blu_rocket);
			bullet.owner = npc_username;

            var aim_direction = point_direction(x, y, target.x, target.y);
            var aim_error = irandom_range(-3, 3);

            bullet.direction = aim_direction + aim_error;
            bullet.speed = bullet_speed;

            can_shoot = false;
        }
    } else {
        // Obstruction detected, use normal soldier movement
        scr_movement_soldier();
    }
} else {
    scr_movement_soldier();
}



// Cooldown logic
if (!can_shoot) {
    cooldown_timer -= 1;
    if (cooldown_timer <= 0) {
        can_shoot = true;
        cooldown_timer = shoot_cooldown;
    }
}


// Check for room boundaries
if ((x + hspeed < 0) || (x + hspeed > room_width)) {
    hspeed = 0;
    moveTimer = 0;
}
if ((y + vspeed < 0) || (y + vspeed > room_height)) {
    vspeed = 0;
    moveTimer = 0;
}


if (place_meeting(x, y, obj_noaccess)) && (scr_avoid_collision() = false) {
	chokeTimer -= 1; // Start choking..
	
	if (chokeTimer <= 0) { // literally chokes
		hp -= 15;
		chokeTimer = chokeTimerReset
	}
}


var wholeMove = (vspeed * vspeed) + (hspeed * hspeed)

if (wholeMove > 0) { //if moving, use animated sprite. if not, use idle sprite
	sprite_index = spr_blu_soldier_moving;
} else {
	sprite_index = spr_blu_soldier;
}

if (isBurning) {
    if (alarm[2] < 0) {
        alarm_set(2, irandom_range(5,60));
    }
}

var healbeamed = instance_place(x, y, heal_beam_blu);
if (healbeamed != noone) {
    hp += 1;
}


if (hp > maxhp) {
	hp = maxhp;
}

if (hp <= 0) {			//Death Code & Killer message
	instance_create_layer(x, y, "Tiles", corpse_blu);
	global.playersConnected -= 1;
	show_debug_message("NPC: " + string(npc_username) + " (" + string(id) + ")" + " has died.")
	
	if lastAddedOwner = undefined {			//handling undefined killers
		var killerMessage = "The Entity killed " + string(npc_username) + "!";
		
		var message_map = ds_map_create();
		ds_map_add(message_map, "text", killerMessage);
		ds_map_add(message_map, "color", c_yellow);
		ds_list_add(global.messageList, message_map);
		
	} else {								// handling actual killers
		var killerMessage = lastAddedOwner + " killed " + string(npc_username) + "!";
		
		var message_map = ds_map_create();
		ds_map_add(message_map, "text", killerMessage);
		ds_map_add(message_map, "color", c_yellow);
		ds_list_add(global.messageList, message_map);
	}
	
	instance_destroy();
}