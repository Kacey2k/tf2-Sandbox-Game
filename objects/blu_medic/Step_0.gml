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

if (isBurning) {
    if (alarm[2] < 0) { // Checks if Alarm 2 is not already running
        alarm_set(2, irandom_range(5,60));
    }
}


var wholeMove = (sqr(vspeed)) + (sqr(hspeed))

if (wholeMove > 0) && ((isUbered = true) || (isUberedByOtherMedic = true)) {
	sprite_index = spr_blu_medic_moving_ubered;
	isChoking = false;
} else if (wholeMove = 0) && ((isUbered = true) || (isUberedByOtherMedic = true)) {
	sprite_index = spr_blu_medic_ubered;
	audio_stop_sound(walk_sound_instance);
} else if (wholeMove > 0) && ((isUbered = false) || (isUberedByOtherMedic = false)) {
	sprite_index = spr_blu_medic_moving;
	isChoking = false;
} else {
	sprite_index = spr_blu_medic;
	audio_stop_sound(walk_sound_instance);
}


if (hp > maxhp) {
	hp = maxhp;
}




if (uberPoint > uberPointMax) { // uber building
	uberPoint = uberPointMax;
}
if (uberPoint = uberPointMax) { // ready to uber
	uberReady = true;
} else {
	uberReady = false;
}

if (uberPoint <= 0) { // after spending uber points
	uberPoint = 0
	isUbered = false;
}

// if pocket is about to die, we pop. Or, if we are about to die, we pop. Medic making them smart decisions!
if ((uberReady = true) && (instance_exists(pocket)) && (pocket.hp < (0.5 * pocket.maxhp)) && (distance_to_object(pocket) <= pocketHealRange)) || (uberReady = true) && (hp <= 30) {
	isUbered = true;
}

if (isUbered) {
	uberPoint -= 1;
}

// Uber Handling when a 2nd Medic Ubers me - See ALARM 4
var healbeamed = instance_place(x, y, heal_beam_blu);
if (instance_exists(healbeamed)) && distance_to_object(healbeamed) <= 5 {
	var healer = healbeamed.creator
	hp += 1;
	isUberedByOtherMedic = false;
	if instance_exists(healer) && (healer.isUbered = true) && (healer.id != id) {
		HealerDisconnected = false;
		isUberedByOtherMedic = true;
		alarm_set(3, 30);
		hp += 5;
	}
}

if instance_exists(healbeamed) {
	var healer = healbeamed.creator;
	if instance_exists(healer) && point_distance(x, y, healer.x, healer.y) >= 35 {
		HealerDisconnected = true;
		isUberedByOtherMedic = false;
		healer = noone;
	}
}

if (isUbered = true) || (isUberedByOtherMedic = true) {
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