instance_create_layer(x, y, "Effects", blu_rocket_explode);

var blast = instance_create_layer(x, y, "Instances", blu_grenade_blast);
blast.owner = owner;


global.countProjectiles -= 1;
instance_destroy();