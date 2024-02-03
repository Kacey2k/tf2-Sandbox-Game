// NPC Cosmetic Selection & Unusual Effects
function npc_cosmetics(){

	// Using All-Class list from the TF2 Wiki
	var cosmetic = ["Ghastly Gibus", "Team Captain", "Antlers", "Bill's Hat", "Modest Pile of Hat", "Noble Amassment of Hats", "Towering Pillar of Hats", "Max's Severed Head", "Alien Swarm Parasite", "Dr's Dapper Topper", "Spine Chilling Skull", "Voodoo Juju", "A Rather Festive Tree", "Summer Hat", "Company Man", "Killer Exclusive", "Hot Dogger", "Merc's Pride Scarf", "Sally Dog", "Point and Shoot", "B.M.O.C.", "Brown Bomber", "Ebenezer", "Holiday Headcase", "Warsworn Helmet", "Robot Chicken Hat", "Human Cannonball", "Crone's Dome", "Executioner", "Tough Stuff Muffs", "Brotherhood of Arms"];
	var effect = ["Nuts & Bolts", "Swarming Flies", "Steaming", "Searing Plasma", "Disco Beat Down", "Stormy Cloud", "Miami Nights", "Haunted Ghosts", "Orbiting Planets", "Purple Energy", "Green Energy", "Scorching Flames", "Burning Flames", "Nebula", "Falling Knives", "Death at Dusk", "Community Sparkle", "*Flaming Bits*"];

	var index = irandom(array_length_1d(cosmetic) - 1);
	var unusualChance = irandom_range(1,100);
	var unusualIndex = irandom(array_length_1d(effect) - 1);
	var unusualHat = "Unusual " + string(effect[unusualIndex]) + " " + string(cosmetic[index]);
	
	if (unusualChance >= 99) { // 2% Unusual Rate
			var unboxMessage = string(npc_username) + " spawned with an " + string(unusualHat) + "!";
			
			var message_map = ds_map_create();
			ds_map_add(message_map, "text", unboxMessage);
			ds_map_add(message_map, "color", c_fuchsia);
			ds_list_add(global.messageList, message_map);
			
			unusualEffect = true;
			
			show_debug_message("[#EVENT] NPC: " + string(npc_username) + " has spawned with an " + string(unusualHat) + "!")
			return unusualHat;
		} else {
			return cosmetic[index];
	}
}