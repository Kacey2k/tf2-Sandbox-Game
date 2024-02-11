var transparency_decrease_rate = 0.03;

image_alpha -= transparency_decrease_rate;

if (image_alpha <= 0) {
	global.countParticles -= 1;
    instance_destroy();
}
