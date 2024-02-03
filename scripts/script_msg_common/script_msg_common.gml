function script_msg_common(){
	
	var messages = ["Hello!", "Hey", "I love chocolate", "Meow", "Woof", "I am ALIVE!", "Yo look at my dope hat!", "I love " + string(room), "Sometimes, I wonder if we are in a game.", "I miss being 3D :(", "404 Message not Found", "Whoever made this map smells", "Who needs Navmeshes!", ":D", ":D", "Gaming.", "I am the best.", "Nothing can kill me.", "I exist to return errors.", "#Follow nKacey on Github for updates!"];
	var randomIndex = irandom(array_length_1d(messages) - 1);
	npc_msgCommon = messages[randomIndex];

	var newMessage = string(npc_username) + ": " + string(npc_msgCommon);
	ds_list_add(global.messageList, newMessage);

	while (ds_list_size(global.messageList) > 5) {
	    ds_list_delete(global.messageList, 0);
	}
}