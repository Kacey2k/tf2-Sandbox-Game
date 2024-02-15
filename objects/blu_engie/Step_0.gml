if (moveTimer > 0) {
    moveTimer--;
} else {
    // Randomly choose a new direction when the timer runs out
    moveDirection = irandom(8);
    moveTimer = moveDuration;
}


if (sentryBuilt = false) {
	mySentry = noone;
}

if (dispenserBuilt = false) {
	mydispenser = noone;
}

//								Check any Damage Objects within collision bounds
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


//							Engineer CORE LOGIC
//							Featuring: Enums
// Engie selects a random locations within 150 pixels to start building. 
// He does not care if you try to kill him. He will get that building up before he gives a darn.



switch (state) {
    case EngineerState.BuildingSentry:
        if (buildingPhase == 0) {
            setSentryTargetLocation(); // Set SENTRY location
            buildingPhase = 1;
        } else if (buildingPhase == 1) {
            moveToBuildingLocation(); // go to SENTRY location
        } else if (buildingPhase == 2) {
            build_sentry(); // Building Sentry. . .
        }
        break;

    case EngineerState.BuildingDispenser:
        if (buildingPhase == 0) {
            setDispenserTargetLocation(); // Set DISPENSER location
            buildingPhase = 1;
        } else if (buildingPhase == 1) {
            moveToBuildingLocation(); // go to DISPENSER location
        } else if (buildingPhase == 2) {
            build_dispenser(); // Building Dispenser. . .
        }
        break;

    case EngineerState.Defending:
	
		if (mySentry = noone) { // if sentry dies while defending :
			buildingPhase = 0;
			state = EngineerState.BuildingSentry;
			break;
		} else if (mydispenser = noone) { // if dispenser dies while defending :
			buildingPhase = 0;
			state = EngineerState.BuildingDispenser;
			break;
			
        } else { // Main State
            engie_Movement(); // <--- (Repair Functionality in here too)
			var target = instance_nearest(x, y, red_flag);

			if (target != noone && point_distance(x, y, target.x, target.y) <= shooting_range) {
			    var obstruction = collision_line(x, y, target.x, target.y, obj_solid, false, true);
			    if (obstruction == noone) {

			        if (can_shoot) {
			            var bullet = instance_create_layer(x, y, "Instances", obj_bullet_blu);
						bullet.owner = npc_username;
			
			            instance_create_layer(x, y, "Effects", wep_flash);
            
			            var aim_direction = point_direction(x, y, target.x, target.y);
			            var aim_error = irandom_range(-4, 4);
			
			            bullet.direction = aim_direction + aim_error;
			            bullet.speed = bullet_speed;
            
			            can_shoot = false;
					}
				}
			}


			// Cooldown logic
			if (!can_shoot) {
			    cooldown_timer -= 1;
			    if (cooldown_timer <= 0) {
			        can_shoot = true;
			        cooldown_timer = shoot_cooldown;
			    }
			}
        }
		
        break;
} // Really scary logical-if-structure ends here.



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

var wholeMove = (sqr(vspeed)) + (sqr(hspeed))

if (wholeMove > 0) && (isUbered) { //if moving, use animated sprite. if not, use idle sprite
	sprite_index = spr_blu_engie_moving_ubered;
} else if (wholeMove = 0) && (((state = EngineerState.BuildingDispenser) && (isUbered)) || ((state = EngineerState.BuildingSentry) && (isUbered))) {
	sprite_index = spr_blu_engie_bap_ubered; // THE BAP UBER PUSH?? WTF?
	audio_stop_sound(walk_sound_instance);
} else if (wholeMove = 0 ) && (isUbered) {
	sprite_index = spr_blu_engie_ubered;
	audio_stop_sound(walk_sound_instance);
} else if (wholeMove > 0) {
	sprite_index = spr_blu_engie_moving;
} else if (wholeMove = 0) && (state = EngineerState.BuildingDispenser || state = EngineerState.BuildingSentry) {
	sprite_index = spr_blu_engie_bap;
} else {
	sprite_index = spr_blu_engie;
}

if (isBurning) {
    if (alarm[2] < 0) { // Checks if Alarm 2 is not already running
        alarm_set(2, irandom_range(5,60));
    }
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