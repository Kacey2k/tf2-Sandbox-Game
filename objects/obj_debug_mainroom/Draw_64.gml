draw_set_color(c_white);

if (CVar_hud == true) {
    var vp_x = view_get_xport(0) + view_get_wport(0);
    var vp_y = view_get_yport(0);
    var text_x = vp_x - 140;
    var line_height = 15;

	draw_set_font(fn_small);
    draw_text(text_x, vp_y + line_height, "FPS: " + string(fps));
    draw_text(text_x, vp_y + line_height * 2, "Objects: " + string(instance_number(all)));
	draw_text(text_x, vp_y + line_height * 3, "Room: " + string(room_get_name(room)));
	draw_text(text_x - 300, vp_y + line_height, "Mouse Pos: X: " + string(mouse_x) + ", Y: " + string(mouse_y));
}
