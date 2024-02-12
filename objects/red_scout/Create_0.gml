global.playersConnected += 1;
owner = "";
hp = 125; //Update Draw HP event if changed
maxhp = hp
teamID = 1; // Blu = 1; RED = 2
teamName = "Red";
classID = 1; // Scout
className = "Scout";
npc_username = script_username();
script_msg_connection();
npc_score = 0;
npc_kills = 0;
alarm[0] = irandom_range(400, 1800); //Min Seconds & Max Seconds (must update in alarm 0 as well!)
alarm[1] = 0; // Extinguish Time
alarm[2] = 0; // Burn Time
alarm[3] = 0; // Uber Effect Time
npc_msgCommon = "";
unusualEffect = false;
npc_cosmetic = npc_cosmetics();
damage_range = 20;
wepOwnersList = ds_list_create();

show_debug_message("NPC Spawn Event [ Username: " + string(npc_username) + " | Class: " + string(className) + " | Team: " + string(teamName) + "]")



last_hit_target_id = noone;
damage_dealt_to_last_hit_target = 0;




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

// Combat Mechanics
shooting_range = 200;
bullet_speed = 20;
can_shoot = true;
shoot_cooldown = 60;
cooldown_timer = shoot_cooldown;

combatDirection = -1;
combat_move_switch = false;
move_cooldown_timer = 60;
move_cooldown = move_cooldown_timer;

//Sound

walk_sound_instance = audio_play_sound(snd_walk, 10, false);
audio_stop_sound(walk_sound_instance); // Stop it immediately so it can be started in the animation end script
