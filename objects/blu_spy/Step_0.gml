if (moveTimer > 0) {
    moveTimer--;
} else {
    // Randomly choose a new direction when the timer runs out
    moveDirection = irandom(8);
    moveTimer = moveDuration;
}


//                                          Core Movement & Combat Loop
//
//											Check any Damage Objects within collision bounds
//											Killer Logic (get it?)
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

switch setDisguise { // Since this is the BLU spy, disguises will be of RED players
	case 0:
		disguisedAs = "Scout";
		disguiseWalkSpeed = 0.6; //cannot exceed spy's max speed for scout
		disguiseWalk = spr_red_scout_moving;
		disguiseIdleUber = spr_red_scout_ubered;
		disguiseWalkUber = spr_red_scout_moving_ubered;
		disguiseIdle = spr_red_scout;
		break;
	case 1:
		disguisedAs = "Soldier";
		disguiseWalkSpeed = 0.4;
		disguiseWalk = spr_red_soldier_moving;
		disguiseIdleUber = spr_red_soldier_ubered;
		disguiseWalkUber = spr_red_soldier_moving_ubered;
		disguiseIdle = spr_red_soldier;
		break;
	case 2:
		disguisedAs = "Pyro";
		disguiseWalkSpeed = 0.5;
		disguiseWalk = spr_red_pyro_moving;
		disguiseIdleUber = spr_red_pyro_ubered;
		disguiseWalkUber = spr_red_pyro_moving_ubered;
		disguiseIdle = spr_red_pyro;
		break;
	case 3:
		disguisedAs = "Demoman";
		disguiseWalkSpeed = 0.45;
		disguiseWalk = spr_red_demo_moving;
		disguiseIdleUber = spr_red_demo_ubered;
		disguiseWalkUber = spr_red_demo_moving_ubered;
		disguiseIdle = spr_red_demo;
		break;
	case 4:
		disguisedAs = "Heavy";
		disguiseWalkSpeed = 0.3;
		disguiseWalk = spr_red_heavy_moving;
		disguiseIdleUber = spr_red_heavy_ubered;
		disguiseWalkUber = spr_red_heavy_moving_ubered;
		disguiseIdle = spr_red_heavy;
		break;
	case 5:
		disguisedAs = "Engineer";
		disguiseWalkSpeed = 0.5;
		disguiseWalk = spr_red_engie_moving;
		disguiseIdleUber = spr_red_engie_ubered;
		disguiseWalkUber = spr_red_engie_moving_ubered;
		disguiseIdle = spr_red_engie;
		break;
	case 6:
		disguisedAs = "Medic";
		disguiseWalkSpeed = 0.6;
		disguiseWalk = spr_red_medic_moving;
		disguiseIdleUber = spr_red_medic_ubered;
		disguiseWalkUber = spr_red_medic_moving_ubered;
		disguiseIdle = spr_red_medic;
		break;
	case 7:
		disguisedAs = "Sniper";
		disguiseWalkSpeed = 0.5;
		disguiseWalk = spr_red_sniper_moving;
		disguiseIdleUber = spr_red_sniper_ubered;
		disguiseWalkUber = spr_red_sniper_moving_ubered;
		disguiseIdle = spr_red_sniper;
		break;
	case 8:
		disguisedAs = "Spy";
		disguiseWalkSpeed = 0.6;
		disguiseWalk = spr_red_spy_moving;
		disguiseIdleUber = spr_red_spy_ubered;
		disguiseWalkUber = spr_red_spy_moving_ubered;
		disguiseIdle = spr_red_spy;
		break;
}



var target = instance_nearest(x, y, red_flag);

switch (state) {
	case SpyState.Roaming:
		//code here
		spy_roaming();
		break;
	case SpyState.Targeting:
		//code here decides response if target visible [retrieved from roaming state]
		break;
	case SpyState.Sapping:
		//code here
		break;
	case SpyState.Stabbing:
		//code here
		break;
}

// Targeting and Movement
if (target != noone && point_distance(x, y, target.x, target.y) <= shooting_range) {
    var obstruction = collision_line(x, y, target.x, target.y, obj_solid, false, true);
    if (obstruction == noone) {
        combatDirection = irandom(4);
        scr_movement_combat();

        if (can_shoot) {
            var bullet = instance_create_layer(x, y, "Instances", obj_bullet_blu);
			bullet.owner = npc_username;
			
            instance_create_layer(x, y, "Effects", wep_flash);
            
            var aim_direction = point_direction(x, y, target.x, target.y);
            var aim_error = irandom_range(-3, 3);
			
            bullet.direction = aim_direction + aim_error;
            bullet.speed = bullet_speed;
            
            can_shoot = false;
        }
    } else {
        spy_roaming();  // Normal movement
    }
} else {
    spy_roaming();  // No target, normal movement
}




// Cooldown
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
	isChoking = true;
	
	if (chokeTimer <= 0) && isChoking { // literally chokes
		hp -= 15;
		chokeTimer = chokeTimerReset
	}
}

if (isBurning) {
    if (alarm[2] < 0) { // Checks if Alarm 2 is not already running
        alarm_set(2, irandom_range(5,60));
    }
}

var wholeMove = (sqr(vspeed)) + (sqr(hspeed))

if wholeMove > 0 && (cloaked) {
	cloakTimer -= 1;
	if cloakTimer <= 0 {
		cloaked = false;
	}
}

if (wholeMove > 0) && (isUbered = true) {
	sprite_index = spr_blu_spy_moving_ubered;
	isChoking = false;
} else if (wholeMove = 0) && (isUbered = true) {
	sprite_index = spr_blu_spy_ubered;
	audio_stop_sound(walk_sound_instance);
} else if (wholeMove > 0) && (isUbered = false) {
	sprite_index = spr_blu_spy_moving;
	isChoking = false;
} else {
	sprite_index = spr_blu_spy;
	audio_stop_sound(walk_sound_instance);
}


// Uber Handling - See ALARM 3
var healbeamed = instance_place(x, y, heal_beam_blu);
if (instance_exists(healbeamed)) && distance_to_object(healbeamed) <= 5 {
	var healer = healbeamed.creator
	hp += 1;
	isUbered = false;
	if instance_exists(healer) && (healer.isUbered = true) {
		HealerDisconnected = false;
		isUbered = true;
		alarm_set(3, 30);
		hp += 5;
	}
}

if instance_exists(healbeamed) {
	var healer = healbeamed.creator;
	if instance_exists(healer) && point_distance(x, y, healer.x, healer.y) >= 35 {
		HealerDisconnected = true;
		isUbered = false;
		healer = noone;
	}
}


if (isUbered = true) {
	hp = maxhp;
	isBurning = false;
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