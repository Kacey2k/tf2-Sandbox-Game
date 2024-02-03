var vw = 500; // Viewport width
var vh = 500; // Viewport height

// Cam creation
camera = camera_create_view(0, 0, vw, vh, 0, -1, -1, -1, -1, -1);

view_camera[0] = camera;
move_speed = 5;

show_debug_message("500x500 CAMERA INITIALIZED!")