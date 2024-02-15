var bluCharacter = irandom_range(0,7);

switch (bluCharacter) {
    case 0: // Blu Scout
		var createObject1 = instance_create_layer(mouse_x, mouse_y, "Instances", blu_scout);
		createObject1.owner = "The Universe";
        break;
	case 1: // Blu Soldier
		var createObject2 = instance_create_layer(mouse_x, mouse_y, "Instances", blu_soldier);
		createObject2.owner = "The Universe";
		break;
	case 2: // Blu Pyro
		var createObject3 = instance_create_layer(mouse_x, mouse_y, "Instances", blu_pyro);
		createObject3.owner = "The Universe";
		break;
	case 3: // Blu Demoman
		var createObject4 = instance_create_layer(mouse_x, mouse_y, "Instances", blu_demo);
		createObject4.owner = "The Universe";
		break;
	case 4: // Blu Heavy
		var createObject5 = instance_create_layer(mouse_x, mouse_y, "Instances", blu_heavy);
		createObject5.owner = "The Universe";
		break;
	case 5: // Blu Engineer
		var createObject6 = instance_create_layer(mouse_x, mouse_y, "Instances", blu_engie);
		createObject6.owner = "The Universe";
		break;
	case 6: // Blu Medic
		var createObject7 = instance_create_layer(mouse_x, mouse_y, "Instances", blu_medic);
		createObject7.owner = "The Universe";
		break;
	case 7: // Blu Sniper
		var createObject8 = instance_create_layer(mouse_x, mouse_y, "Instances", blu_sniper);
		createObject8.owner = "The Universe";
		break;
}

show_debug_message("#Input: Global Right Pressed Attempted")