var redCharacter = irandom_range(0,4);

switch (redCharacter) {
    case 0: // Red Scout
		var createObject1 = instance_create_layer(mouse_x, mouse_y, "Instances", red_scout);
		createObject1.owner = "The Entity";
        break;
	case 1: // Red Soldier
		var createObject2 = instance_create_layer(mouse_x, mouse_y, "Instances", red_soldier);
		createObject2.owner = "The Entity";
		break;
	case 2: // Red Pyro
		var createObject3 = instance_create_layer(mouse_x, mouse_y, "Instances", red_pyro);
		createObject3.owner = "The Entity";
		break;
	case 3: // Red Demoman
		var createObject4 = instance_create_layer(mouse_x, mouse_y, "Instances", red_demo);
		createObject4.owner = "The Entity";
		break;
	case 4: // Red Demoman
		var createObject5 = instance_create_layer(mouse_x, mouse_y, "Instances", red_heavy);
		createObject5.owner = "The Entity";
		break;
}

show_debug_message("#Input: Global Left Pressed Attempted")