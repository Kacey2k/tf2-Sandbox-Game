// FUTURE: Create custom message banks for specific Classes
global.playersConnected += 1;
owner = "";
hp = 300; //Update Draw HP event if changed
maxhp = hp;
teamID = 1; // Blu = 1; RED = 2
teamName = "Blu";
classID = 5; // Heavy
className = "Heavy";
npc_username = script_username(); // random username script
script_msg_connection(); // connection message
npc_score = 0;
npc_kills = 0;
alarm[0] = irandom_range(400, 1800); //Message Generation Alarm
alarm[1] = 0; // Extinguish Time
alarm[2] = 0; // Burn Time
npc_msgCommon = "";
unusualEffect = false;
npc_cosmetic = npc_cosmetics();
damage_range = 20;
wepOwnersList = ds_list_create();

show_debug_message("NPC Spawn Event [ Username: " + string(npc_username) + " | Class: " + string(className) + " | Team: " + string(teamName) + "]")

// Movement
hspeed = 0;
vspeed = 0;
isMoving = false;

moveDirection = -1; // -1 indicates no initial direction
moveTimer = 0;
moveDuration = room_speed * 2;

chokeTimerReset = 100
chokeTimer = chokeTimerReset

//Misc Vars
isDead = false;
isUbered = false;
HealerDisconnected = false;
isBurning = false;
isSelected = false;

// Combat Mechanics
shooting_range = 230;
bullet_speed = 10;
can_shoot = true;
shoot_cooldown = 10;
cooldown_timer = shoot_cooldown;
personalSpace = 20;
drawgunTimerReset = 60;
drawgunTimer = drawgunTimerReset;
isDrawn = false;

// Combat Movement
combatDirection = -1;
combat_move_switch = false;
move_cooldown_timer = 60;
move_cooldown = move_cooldown_timer;

//Sound

walk_sound_instance = audio_play_sound(snd_walk, 10, false);
audio_stop_sound(walk_sound_instance); // Stop it immediately so it can be started in the animation end script
