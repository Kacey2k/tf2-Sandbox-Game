function script_msg_common_pyro(){
	
	var messages = ["Mmmph", "Mmmph mmmph", "MMMMPH!", "MMMPH MMPH!!!", "HMPH!", "HUDDA HUDDA HUDDA"];
	var randomIndex = irandom(array_length_1d(messages) - 1);
	npc_msgCommon = messages[randomIndex];

	var newMessage = string(npc_username) + ": " + string(npc_msgCommon);
	
	var message_map = ds_map_create();
	ds_map_add(message_map, "text", newMessage);
	ds_map_add(message_map, "color", c_black);
	ds_list_add(global.messageList, message_map);
}