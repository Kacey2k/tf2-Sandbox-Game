/// @description Ubered by 2nd Medic
if isUberedByOtherMedic = true && HealerDisconnected = false {
	alarm_set(4, 30); // continue uber
} else {
	isUberedByOtherMedic = false;
	alarm_set(4, 0); // Stop Uber
}