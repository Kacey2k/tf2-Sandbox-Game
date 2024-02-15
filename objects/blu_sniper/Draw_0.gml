draw_self();

// Unusual Application [TODO]
//if (unusualEffect) {
//    currentUnusualSprite = unusual_effects();
//    if (currentUnusualSprite != noone) {
//        draw_sprite_ext(currentUnusualSprite, image_index, x, y - 10, 1, 1, 0, c_white, 1);
//    }
//}

// Health bar dimensions and position
var barWidth = 10; // Width of health bar
var barHeight = 1; // Height of health bar
var xOffset = -5; // Horizontal offset from center of NPC
var yOffset = -10; // Vertical offset from center of NPC

// SHADOW rendering
draw_sprite(spr_shadow, 0, x - 4, y + 2);


// Icon Placement
var iconWidth = sprite_get_width(ico_blu_sniper);
var iconHeight = sprite_get_height(ico_blu_sniper);
var iconXOffset = -iconWidth / 2; // Center the icon horizontally above NPC
var iconYOffset = yOffset - iconHeight - 5; // Position the icon above the health bar with a 5px gap

if (scoped) {
    draw_sprite(ico_blu_sniper_scoped, floor(icon_frame), x + iconXOffset, y + iconYOffset);
} else {
    draw_sprite(ico_blu_sniper, floor(icon_frame), x + iconXOffset, y + iconYOffset);
}


draw_set_font(fn_small);

if (scoped) {
	draw_set_color(c_aqua);
	draw_text(id.x + 10, id.y + -40, "*SCOPED*");
	if (isBurning) {
		draw_sprite(particle_burn_2, -1, x + irandom_range(-2,2), y + irandom_range(-3,3));
		draw_set_color(c_red);
		draw_text(id.x + 10, id.y + -50, "**ON FIRE!**");
	} else if (isUbered) {
		draw_set_color(c_aqua)
		draw_text(id.x + 10, id.y + -50, "**UBERED**");
	}
} else if (isBurning = true) && (scoped = false) {
	draw_sprite(particle_burn_2, -1, x + irandom_range(-2,2), y + irandom_range(-3,3));
	draw_set_color(c_red);
	draw_text(id.x + 10, id.y + -40, + "**ON FIRE!**");
} else if (scoped = false) && (isUbered) {
	draw_set_color(c_aqua)
	draw_text(id.x + 10, id.y + -40, "**UBERED**");
}

draw_set_color(c_black);
draw_text(id.x + 10, id.y + -30, string(npc_username));
draw_text(id.x + 10, id.y + -20, string(className));

var mx = mouse_x;
var my = mouse_y;

// Hover Stats
if (point_in_rectangle(mx, my, bbox_left - 30, bbox_top - 30, bbox_right + 30, bbox_bottom + 30)) { // Hover Stats
	if (hp <= 60) {
		draw_set_color(c_red);
		draw_text(x + 10, y - 10, "Health: " + string(hp));
	} else {
		draw_set_color(c_green);
		draw_text(x + 10, y - 10, "Health: " + string(hp));
	}
	
	if (string_pos("Unusual", npc_cosmetic) > 0) { // Unusual Hats
		draw_set_color(c_purple);
		draw_text(x + 10, y, "Wearing: " + string(npc_cosmetic));
		draw_set_color(c_black);
	} else { // Normal Hats
	draw_set_color(c_fuchsia)
    draw_text(x + 10, y, "Wearing: " + string(npc_cosmetic));
	draw_set_color(c_black);
	}
} // End Hover Stats

// health bar black BG
draw_rectangle(x + xOffset, y + yOffset, x + xOffset + barWidth, y + yOffset + barHeight, false);

// Calc current health
var healthPercentageScout = hp / maxhp;

// Drawing current health
draw_set_color(c_green);
draw_rectangle(x + xOffset, y + yOffset, x + xOffset + barWidth * healthPercentageScout, y + yOffset + barHeight, false);
