global.tickCount = 0;
global.seconds = 0;
global.minutes = 0;
global.paused = false;
global.messageList = ds_list_create();
global.username = "player";
global.playersConnected = 0;
global.playerList = ds_list_create();
global.guiText = c_black;
global.guiActive = false;
global.countProjectiles = 0;
global.countParticles = 0;

show_debug_message("_root CONTROLLER INITIALIZED SUCCESFULLY");