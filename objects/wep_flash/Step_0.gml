if (image_index >= image_number - 1) {
	global.countParticles -= 1;
    instance_destroy(); // Destroy particle
}