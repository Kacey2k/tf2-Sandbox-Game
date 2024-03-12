// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function spriteControllerSpy(){
	
	if (disguised) { // Controls Spy's Sprite Depending on whether or not he is Disguised.
		
		if (isMoving) && (isUbered) {
			
			sprite_index = disguiseWalkUber;
			
		} else if (!isMoving) && (isUbered) {
			
			sprite_index = disguiseIdleUber;
			audio_stop_sound(walk_sound_instance);
			
		} else if (isMoving) && (!isUbered) {
			
			sprite_index = disguiseWalk;
			
		} else {
			
			sprite_index = disguiseIdle;
			audio_stop_sound(walk_sound_instance);
			
		}
		
	} else { // If he is not disguised, use these sprites.
		
		if (isMoving) && (isUbered) {
		
			sprite_index = spr_blu_spy_moving_ubered;
		
		} else if (!isMoving) && (isUbered) {
			
			sprite_index = spr_blu_spy_ubered;
			audio_stop_sound(walk_sound_instance);
			
		} else if (isMoving) && (!isUbered) {
			
			sprite_index = spr_blu_spy_moving;
			
		} else {
			
			sprite_index = spr_blu_spy;
			audio_stop_sound(walk_sound_instance);
			
		}
	}
}