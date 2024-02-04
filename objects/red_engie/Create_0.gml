// FUTURE: Create custom message banks for specific Classes

global.playersConnected += 1;
owner = "";
hp = 125; //Update Draw HP event if changed
maxhp = hp;
teamID = 2; // Blu = 1; RED = 2
teamName = "Red";
classID = 6; // Engie
className = "Engie";
npc_username = script_username();
script_msg_connection();
npc_score = 0;
npc_kills = 0;

alarm[0] = irandom_range(400, 1800); //Min Seconds & Max Seconds (must update in alarm 0 as well!)
alarm[1] = 0; // Extinguish Time
alarm[2] = 0; // Burn Time
npc_msgCommon = "";
unusualEffect = false;
npc_cosmetic = npc_cosmetics();
damage_range = 20;
wepOwnersList = ds_list_create();






// Engineer States
//enum EngineerState {
//    BuildingSentry,
//	  BuildingDispenser,
//    Defending
//}

// Visual States
//enum EngineerStatus {
//	statusSentry,
//	statusDispenser,
//	statusDefending
//}

//Engineer Vars
state = EngineerState.BuildingSentry; // Starting State
status = EngineerStatus.statusSentry;

sentryBuilt = false;
dispenserBuilt = false;

mySentry = noone;
mydispenser = noone;


sentryBuildingTimerReset = 300; // SENTRY build
sentryBuildingTimer = sentryBuildingTimerReset;
placeSentryDistance = 10

repairSentryTimeReset = 60; // SENTRY repair
repairSentryTime = repairSentryTimeReset;
canRepairSentry = false;

dispenserBuildingTimerReset = 300; //DISPENSER build
dispenserBuildingTimer = dispenserBuildingTimerReset;
placeDispenserDistance = 10;

repairDispenserTimeReset = 60;  // DISPENSER repair
repairDispenserTime = repairDispenserTimeReset;
canRepairDispenser = false;

// Building Locations
SentryTargetX = 0;
SentryTargetY = 0;
DispenserTargetX = 0;
DispenserTargetY = 0;

SentryDistance = 0;
DispenserDistance = 0;

buildingPhase = 0;

// Movement
hspeed = 0;
vspeed = 0;
isMoving = false;

moveDirection = -1; // -1 indicates no initial direction
moveTimer = 0;
moveDuration = room_speed * 2;


chokeTimerReset = 100
chokeTimer = chokeTimerReset;





//Misc Vars
isDead = false;
isUbered = false;
isBurning = false;




// Combat Mechanics
shooting_range = 200;
bullet_speed = 20;
can_shoot = true;
shoot_cooldown = 50;
cooldown_timer = shoot_cooldown;
// Combat Movement
combatDirection = -1;
combat_move_switch = false;
move_cooldown_timer = 60;
move_cooldown = move_cooldown_timer;

//Sound

walk_sound_instance = audio_play_sound(snd_walk, 10, false);
audio_stop_sound(walk_sound_instance); // Stop it immediately so it can be started in the animation end script





// debug
show_debug_message("NPC Spawn Event [ Username: " + string(npc_username) + " | Class: " + string(className) + " | Team: " + string(teamName) + "]")
