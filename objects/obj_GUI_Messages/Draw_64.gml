if (global.guiActive = true) {

	// GUI Size
    var rect_width = 500;
    var rect_height = 100;

    var vp_x = view_get_xport(0);
    var vp_y = view_get_yport(0) + view_get_hport(0) - rect_height; // bottom left corner of the viewport
	
    draw_set_alpha(1);
	draw_set_font(fn_small);
	
	var i;
	for (i = 0; i < ds_list_size(global.messageList); i++) {
	    var message_map = ds_list_find_value(global.messageList, i);
	    var msg = ds_map_find_value(message_map, "text");
	    var col = ds_map_find_value(message_map, "color");

	    draw_set_color(col);
	    draw_text(vp_x + 15, vp_y + 5 + (i * 20), msg);
	}
	draw_set_color(c_black); // set to default after drawing msg

	while (ds_list_size(global.messageList) > 5) {
	    var message_map = ds_list_find_value(global.messageList, 0);
	    ds_map_destroy(message_map);
	    ds_list_delete(global.messageList, 0);
	}
}
