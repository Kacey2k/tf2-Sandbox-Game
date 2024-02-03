global.countProjectiles += 1;
alarm_set(0, 3); // Particle emission
alarm_set(1, 3600); // Despawn after this amount of time
owner = "";