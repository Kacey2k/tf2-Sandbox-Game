owner = "The Entity";
creator = noone;
level = 1;
maxHealth = 150; // lvl 1: 150		lvl 2: 180		lvl 3: 216
currentHealth = maxHealth; // Current health starts with max
hp = currentHealth;

isSapped = false;


enum DispenserLevel { // Dispenser Levels
	One,
	Two,
	Three
}

currentLevel = DispenserLevel.One;
levelChanged = true;

// Heal Targets init
healet_speed = 6;
can_shoot = true;
shoot_cooldown = 5;
cooldown_timer = shoot_cooldown;