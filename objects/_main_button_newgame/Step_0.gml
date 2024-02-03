if (mouse_check_button_pressed(mb_left)) {
    var button_instance = instance_position(mouse_x, mouse_y, object_index);
    if (button_instance != noone) {
        room_goto(battlezone);
    }
}
