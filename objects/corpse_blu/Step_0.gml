if (startDissapearing = true) {
	var transparency_decrease_rate = 0.0025;

	image_alpha -= transparency_decrease_rate;

	if (image_alpha <= 0) {
	    instance_destroy();
	}

}