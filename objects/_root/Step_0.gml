global.tickCount += 1; // Tickrate Counter

if (global.tickCount mod 60 == 0) { // Seconds Counter
    global.seconds += 1;
	show_debug_message("#gameClock @second #" + string(global.seconds))
	
	if (global.seconds mod 60 == 0) { // Minutes Counter
    global.minutes += 1;
	show_debug_message("#gameClock @minute #" + string(global.minutes))
	}
}