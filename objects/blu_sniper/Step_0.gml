if (moveTimer > 0) {
    moveTimer--;
} else {
    // Randomly choose a new direction when the timer runs out
    moveDirection = irandom(8);
    moveTimer = moveDuration;
}

if scoped = true {
	if (scopedMoveTimer > 0) {
		scopedMoveTimer -= 1;
	} else {
		// Switch Scoped Movement Direction
		scopedMoveDirection = irandom(6);
		scopedMoveTimer = scopedMoveTimerReset;
	}
}

icon_frame += icon_image_speed;
if (scoped) {
    if (icon_frame >= sprite_get_number(ico_blu_sniper_scoped)) {
        icon_frame = 0;
    }
} else {
    if (icon_frame >= sprite_get_number(ico_blu_sniper)) {
        icon_frame = 0;
    }
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


// Sniper Logic
var target = instance_nearest(x, y, red_flag);

if instance_exists(target) {
	targetObstruction = collision_line(x, y, target.x, target.y, obj_solid, false, true);
} else {
	targetObstruction = noone;
}

switch (state) {
	case SniperState.Roaming: // Roaming
		if (target != noone) && (targetObstruction = noone) {
			state = SniperState.Scoped;
			break;
		} else {
			sniper_roaming();
			break;
		}
	case SniperState.Scoped: // Scoped In
		if distance_to_object(target) > detectionDistance {
			state = SniperState.Roaming;
			break;
		} else if (distance_to_object(target) <= escapeDistance) && (targetObstruction == noone) {
			state = SniperState.Escaping;
			break;
		} else {
			sniper_scoped();
			break;
		}
	case SniperState.Escaping: // Escaping with SMG out
		if distance_to_object(target) > escapeDistance {
			state = SniperState.Scoped;
			break;
		} else {
			sniper_escaping();
			break;
		}
}


// Cooldown
if (!can_shoot) {
    cooldown_timer -= 1;
    if (cooldown_timer <= 0) {
        can_shoot = true;
        cooldown_timer = shoot_cooldown;
    }
}

// Cooldown
if (!can_shoot_SMG) {
    cooldown_timer_SMG -= 1;
    if (cooldown_timer_SMG <= 0) {
        can_shoot_SMG = true;
        cooldown_timer_SMG = shoot_cooldown_SMG;
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

if (wholeMove > 0) && (isUbered = true) {
	sprite_index = spr_blu_sniper_moving_ubered;
	isChoking = false;
} else if (wholeMove = 0) && (isUbered = true) {
	sprite_index = spr_blu_sniper_ubered;
	audio_stop_sound(walk_sound_instance);
} else if (wholeMove > 0) && (isUbered = false) {
	sprite_index = spr_blu_sniper_moving;
	isChoking = false;
} else {
	sprite_index = spr_blu_sniper;
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