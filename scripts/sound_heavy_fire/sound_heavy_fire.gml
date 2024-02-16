function sound_heavy_fire(){
    var cam_size = 600;
    var cam_x = camera_get_view_x(view_camera[0]);
    var cam_y = camera_get_view_y(view_camera[0]);
    var cam_w = camera_get_view_width(view_camera[0]);
    var cam_h = camera_get_view_height(view_camera[0]);

    var cam_center_x = cam_x + cam_w / 2;
    var cam_center_y = cam_y + cam_h / 2;

    var obj_x = x;
    var obj_y = y;

    var in_camera_view = (obj_x >= cam_x && obj_x <= cam_x + cam_w) && (obj_y >= cam_y && obj_y <= cam_y + cam_h);

    if (in_camera_view && !audio_is_playing(shoot_sound)) {
        var falloff_ref = 100;
        var falloff_max = 500;
        var falloff_factor = 1;
        var adjusted_obj_x = cam_center_x - obj_x;

        shoot_sound = audio_play_sound_at(snd_shoot_gatling, adjusted_obj_x, obj_y - cam_center_y, 0, falloff_ref, falloff_max, falloff_factor, 0, 10, 1, 0, random_range(0.95,1.15));
    } else if (!in_camera_view || audio_is_playing(shoot_sound)) {
        audio_stop_sound(shoot_sound);
    }
}