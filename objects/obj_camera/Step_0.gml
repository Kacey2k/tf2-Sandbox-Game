var move_x = 0;
var move_y = 0;

if (keyboard_check(ord("W"))) move_y -= move_speed;
if (keyboard_check(ord("S"))) move_y += move_speed;
if (keyboard_check(ord("A"))) move_x -= move_speed;
if (keyboard_check(ord("D"))) move_x += move_speed;

var cam_x = camera_get_view_x(camera);
var cam_y = camera_get_view_y(camera);
var cam_width = camera_get_view_width(camera);
var cam_height = camera_get_view_height(camera);

// Zooming
var zoom_speed = 0.2;
var scroll = mouse_wheel_down() - mouse_wheel_up();
var new_width = cam_width + scroll * zoom_speed * cam_width;
var new_height = cam_height + scroll * zoom_speed * cam_height;

// Min Max zooms
var min_width = 250; // Min width
var max_width = 1000; // Max width
new_width = clamp(new_width, min_width, max_width);
new_height = new_width; // Maintain aspect ratio
// update cam
camera_set_view_size(camera, new_width, new_height);

// update cam pos
cam_x += move_x;
cam_y += move_y;
cam_x = max(0, cam_x);
cam_y = max(0, cam_y);
cam_x = min(room_width - new_width, cam_x);
cam_y = min(room_height - new_height, cam_y);
camera_set_view_pos(camera, cam_x, cam_y);