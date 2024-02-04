draw_self();

var barWidth = 10;
var barHeight = 1;
var xOffset = -5;
var yOffset = -10;

var mx = mouse_x;
var my = mouse_y;

// Hover Stats
if (point_in_rectangle(mx, my, bbox_left - 30, bbox_top - 30, bbox_right + 30, bbox_bottom + 30)) {
	draw_set_font(fn_small);
	draw_set_color(c_black);
	draw_text(id.x + 10, id.y + -30, string(owner) + "'s Dispenser");
	draw_text(id.x + 10, id.y + -20, + "Level: " + string(level));
}

// HP BAR
draw_set_color(c_black);
draw_rectangle(x + xOffset, y + yOffset, x + xOffset + barWidth, y + yOffset + barHeight, false);
var healthPercentage = currentHealth / maxHealth;
draw_set_color(c_green);
draw_rectangle(x + xOffset, y + yOffset, x + xOffset + barWidth * healthPercentage, y + yOffset + barHeight, false);