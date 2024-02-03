if (global.guiActive = true) {
    var alpha = 0.5;
    var color = make_color_rgb(128, 128, 128);

	// GUI Size
    var rect_width = 500;
    var rect_height = 100;
    var border_width = 3;

    var vp_x = view_get_xport(0);
    var vp_y = view_get_yport(0) + view_get_hport(0) - rect_height; // bottom left of vp

	// border
    draw_set_color(c_black);
    draw_set_alpha(0.5);
    draw_rectangle(vp_x - border_width, vp_y - border_width, 
                   vp_x + rect_width + border_width, vp_y + rect_height + border_width, false);

    // inner rectangle
    draw_set_color(color);
    draw_set_alpha(alpha);
    draw_rectangle(vp_x, vp_y, vp_x + rect_width, vp_y + rect_height, false);

    draw_set_alpha(1);
}
