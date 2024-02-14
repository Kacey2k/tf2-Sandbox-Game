function script_msg_common_demo(){
	
	var messages = ["We did it mate!", "Move it lads!", "Get going!", "Move the gear up lads!", "Aye!", "Bloody spy!", "Aye give us a hand!", "I can't hold them off alone here!", "Freeeedoooom!!", "Have at 'em lads!", "Leeeet's do iiiit!!", "Imagine if I haven't been drunk", "I'm drunk - you don't have an excuse!"];
	var randomIndex = irandom(array_length_1d(messages) - 1);
	npc_msgCommon = messages[randomIndex];

	var newMessage = string(npc_username) + ": " + string(npc_msgCommon);
	
	var message_map = ds_map_create();
	ds_map_add(message_map, "text", newMessage);
	ds_map_add(message_map, "color", c_black);
	ds_list_add(global.messageList, message_map);
}