var bluCharacter = irandom_range(0,5);

switch (bluCharacter) {
    case 0: // Blu Scout
		var createObject1 = instance_create_layer(mouse_x, mouse_y, "Instances", blu_scout);
		createObject1.owner = "The Entity";
        break;
	case 1: // Blu Soldier
		var createObject2 = instance_create_layer(mouse_x, mouse_y, "Instances", blu_soldier);
		createObject2.owner = "The Entity";
		break;
	case 2: // Blu Pyro
		var createObject3 = instance_create_layer(mouse_x, mouse_y, "Instances", blu_pyro);
		createObject3.owner = "The Entity";
		break;
	case 3: // Blu Demoman
		var createObject4 = instance_create_layer(mouse_x, mouse_y, "Instances", blu_demo);
		createObject4.owner = "The Entity";
		break;
	case 4:
		var createObject5 = instance_create_layer(mouse_x, mouse_y, "Instances", blu_heavy);
		createObject5.owner = "The Entity";
		break;
	case 5:
		var createObject6 = instance_create_layer(mouse_x, mouse_y, "Instances", blu_engie);
		createObject6.owner = "The Entity";
		break;
}

show_debug_message("#Input: Global Right Pressed Attempted")