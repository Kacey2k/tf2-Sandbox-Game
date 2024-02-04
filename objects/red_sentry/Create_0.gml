owner = "The Entity";
creator = other;
turretOwner = id;
maxHealth = 150;
currentHealth = maxHealth; // Current health
level = 1;

// Engie error catching var
sentryBuilt = true;


turret = instance_create_layer(x, y, "Map", red_sentry_1);
turret.owner = turretOwner;
turret.image_angle = 0;
turret.currentLevel = 1;
turret.scan_direction = 1; // Direction of scanning: 1 for clockwise, -1 for counter-clockwise.
turret.scan_speed = 1;
turret.scan_range = 45; // in degs
turret.is_scanning = true;
current_target = noone;
turret_state = "scanning";

isSapped = false;

//enum SentryLevel {
//	One,
//	Two,
//	Three
//}

currentLevel = SentryLevel.One;
levelChanged = true;


// Targeting Init
bullet_speed = 20;
can_shoot = true;
shoot_cooldown = 15;
cooldown_timer = shoot_cooldown;
rocket_unlock = false;