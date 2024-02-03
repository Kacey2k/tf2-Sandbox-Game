draw_self();

// Health bar
var barWidth = 10;
var barHeight = 1;
var xOffset = -5;
var yOffset = -10;

// SHADOW Rendering
var ShadowWidth = sprite_get_width(spr_shadow);
var ShadowHeight = sprite_get_height(spr_shadow);
var ShadowXOffset = ShadowWidth - 10; // Center shadow below NPC
var ShadowYOffset = yOffset + ShadowHeight + 11; // Position the shadow below NPC
draw_sprite(spr_shadow, 0, x + ShadowXOffset, y + ShadowYOffset);


// Icon
var iconWidth = sprite_get_width(ico_blu_soldier);
var iconHeight = sprite_get_height(ico_blu_soldier);
var iconXOffset = -iconWidth / 2;
var iconYOffset = yOffset - iconHeight - 5;
draw_sprite(ico_blu_soldier, 0, x + iconXOffset, y + iconYOffset);


// Burning
if (isBurning = true) {
	draw_sprite(particle_burn_2, -1, x + irandom_range(-2,2), y + irandom_range(-3,3));
	draw_set_color(c_red);
	draw_text(id.x + 10, id.y + -40, + "**ON FIRE!**");
}


draw_set_font(fn_small);
draw_set_color(c_black);
draw_text(id.x + 10, id.y + -30, string(npc_username));
draw_text(id.x + 10, id.y + -20, string(className));

//Mouse POS
var mx = mouse_x;
var my = mouse_y;

// Mouse Hover
if (point_in_rectangle(mx, my, bbox_left - 30, bbox_top - 30, bbox_right + 30, bbox_bottom + 30)) { // Hover Stats
	if (hp <= 90) {
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
}


draw_rectangle(x + xOffset, y + yOffset, x + xOffset + barWidth, y + yOffset + barHeight, false);

var healthPercentage = hp / maxhp; // Max Hp

draw_set_color(c_green);
draw_rectangle(x + xOffset, y + yOffset, x + xOffset + barWidth * healthPercentage, y + yOffset + barHeight, false);
