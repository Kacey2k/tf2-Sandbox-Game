// Lil msg that appears when an NPC spawns
function script_msg_connection(){
	
	var joinMessage = string(npc_username) + " connected, joining team: " + string(teamName);
	
	var message_map = ds_map_create();
	ds_map_add(message_map, "text", joinMessage);
	ds_map_add(message_map, "color", c_white);
	ds_list_add(global.messageList, message_map);
}