function uncloak(){

	if cloaked = true {
		image_alpha += 0.01;
	}
	
	if image_alpha >= 1 {
		canCloak = true;
		cloaked = false;
		seen = true;
		return;
	}
}