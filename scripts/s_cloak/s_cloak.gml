function s_cloak(){
	// this function decreases the spy's sprite transparency and switches his states
	if canCloak = true {
		image_alpha -= 0.01;
	}
	
	if image_alpha <= 0 {
		canCloak = false;
		cloaked = true;
		seen = false;
		return;
	}
}