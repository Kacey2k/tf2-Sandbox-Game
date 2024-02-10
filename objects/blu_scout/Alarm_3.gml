/// @description Uber
if isUbered = true && HealerDisconnected = false {
	alarm_set(3, 30); // continue uber
} else {
	isUbered = false;
	alarm_set(3, 0); // Stop Uber
}