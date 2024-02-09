global.playersConnected += 1;
owner = "";
hp = 150; //Update Draw HP event if changed
maxhp = hp;
teamID = 1; // Blu = 1; RED = 2
teamName = "Blu";
classID = 7;
className = "Medic";
npc_username = script_username();
script_msg_connection();
npc_score = 0;
npc_kills = 0;

alarm[0] = irandom_range(400, 1800); //Min Seconds & Max Seconds (must update in alarm 0 as well!)
alarm[1] = 0; // Extinguish Time
alarm[2] = 0; // Burn Time
alarm[3] = 60; // Uber build default timer
npc_msgCommon = "";
unusualEffect = false;
npc_cosmetic = npc_cosmetics();
damage_range = 20;
wepOwnersList = ds_list_create();



// Medic Specific Variables

enum MedicState {
	Alone,
	Pocketing
}

state = MedicState.Alone;
friendly = instance_nearest(x, y, blu_flag);
pocketlist = ds_list_create();


pocket = noone;
pocketDetectionRange = 150; // How close a partner must be to be followed by a medic
pocketHealRange = 30; // How close medic must be to start healing
pocketPersonalSpace = 10; // distance to prevent medic from merging with pocket

beam_speed = 3;
can_heal = true;
heal_cooldown = 10;
cooldown_timer = heal_cooldown;

uberPoint = 0;
uberPointMax = 100;
uberReady = false;






// Movement
hspeed = 0;
vspeed = 0;
isMoving = false;

roam_timer = room_speed * 5; // setting roam location
roam_duration = roam_timer;

moveDirection = -1; // -1 indicates no initial direction
moveTimer = 0;
moveDuration = room_speed * 2;

//Misc Vars
isDead = false;
isUbered = false;
isBurning = false;


chokeTimerReset = 100
chokeTimer = chokeTimerReset

// Combat Movement
combatDirection = -1;
combat_move_switch = false;
move_cooldown_timer = 20;
move_cooldown = move_cooldown_timer;
personalSpace = 20

//Sound

walk_sound_instance = audio_play_sound(snd_walk, 10, false);
audio_stop_sound(walk_sound_instance); // Stop it immediately so it can be started in the animation end script
