var cam_size = 600;

var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

var obj_x = x;
var obj_y = y;

var in_camera_view = (obj_x >= cam_x && obj_x <= cam_x + cam_size) && (obj_y >= cam_y && obj_y <= cam_y + cam_size);

if (in_camera_view && !audio_is_playing(walk_sound_instance)) {
    walk_sound_instance = audio_play_sound(snd_walk, 10, false, 1, 0, random_range(0.65,0.8));
} else if (!in_camera_view || audio_is_playing(walk_sound_instance)) {
    audio_stop_sound(walk_sound_instance);
}
