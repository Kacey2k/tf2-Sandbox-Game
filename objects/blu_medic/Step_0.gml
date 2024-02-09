if pocket = undefined {
	pocket = noone;
	state = MedicState.Alone;
}

if (pocket != noone) {
	state = MedicState.Pocketing;
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


// Medic State Switch, all dependent on nearby pockets
switch (state) {
    case MedicState.Alone:
        medic_movement_roam();
		ds_list_clear(pocketlist);

        break;
		
    case MedicState.Pocketing:
	
		if pocket != noone {
			medic_movement_pocket();
		} else {
			state = MedicState.Alone;
			break;
		}
		
        break;
}

// Cooldown logic
if (!can_heal) {
    cooldown_timer -= 1;
    if (cooldown_timer <= 0) {
        can_heal = true;
        cooldown_timer = heal_cooldown;
    }
}


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
	sprite_index = spr_blu_medic_moving;
} else {
	sprite_index = spr_blu_medic;
}

if (isBurning) {
    if (alarm[2] < 0) { // Checks if Alarm 2 is not already running
        alarm_set(2, irandom_range(5,60));
    }
}


if (hp > maxhp) {
	hp = maxhp;
}

if (uberPoint > uberPointMax) {
	uberPoint = uberPointMax;
}

if (uberPoint = uberPointMax) {
	uberReady = true;
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