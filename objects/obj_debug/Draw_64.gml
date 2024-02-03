draw_set_color(c_black);

if (CVar_hud == true) {
    var vp_x = view_get_xport(0) + view_get_wport(0);
    var vp_y = view_get_yport(0);

    // text pos
    var text_x = vp_x - 140; // placed at right edge of vp
    var line_height = 15; // space between new lines

	draw_set_font(fn_small);
    draw_text(text_x, vp_y + line_height, "FPS: " + string(fps));
    draw_text(text_x, vp_y + line_height * 2, "Objects: " + string(instance_number(all)));
	draw_text(text_x, vp_y + line_height * 3, "Room: " + string(room_get_name(room)));
	draw_text(text_x, vp_y + line_height * 4, "NPCs: " + string(global.playersConnected));
	draw_text(text_x - 300, vp_y + line_height, "Mouse Pos: X: " + string(mouse_x) + ", Y: " + string(mouse_y));
	draw_text(text_x - 300, vp_y + line_height * 2, "Projectile Count: " + string(global.countProjectiles));
	draw_text(text_x - 300, vp_y + line_height * 3, "Particle Count: " + string(global.countParticles));
	draw_text(text_x - 300, vp_y + line_height * 4, "Tick Count: " + string(global.tickCount));
	draw_text(text_x - 300, vp_y + line_height * 5, "Minutes: " + string(global.minutes));
	draw_text(text_x - 300, vp_y + line_height * 6, "Seconds: " + string(global.seconds));
}
