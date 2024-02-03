// Define the camera and viewport size
var cam_size = 600;

// Get the camera's top-left position
var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

// Get the object's position
var obj_x = x;
var obj_y = y;

// Calculate if the object is within the camera's view
var in_camera_view = (obj_x >= cam_x && obj_x <= cam_x + cam_size) && (obj_y >= cam_y && obj_y <= cam_y + cam_size);

// Play or stop sound based on object's position relative to the camera
if (in_camera_view && !audio_is_playing(walk_sound_instance)) {
    // Start playing the unique sound instance for this NPC
    walk_sound_instance = audio_play_sound(snd_walk, 10, false, 1, 0, random_range(0.75,0.9));
} else if (!in_camera_view || audio_is_playing(walk_sound_instance)) {
    // Stop the sound if it's already playing or if the object is out of the camera view
    audio_stop_sound(walk_sound_instance);
}
