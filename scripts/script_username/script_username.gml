function script_username() {
    // Possible Usernames for NPCs
    var usernames = ["A Professional With Standards", "AimBot", "AmNot", "Aperture Science Prototype XR7", "Archimedes!", "BeepBeepBoop", "Big Mean Muther Hubbard", "Black Mesa", "BoomerBile", "Cannon Fodder", "CEDA", "Chell", "Chucklenuts", "Companion Cube", "Crazed Gunman", "CreditToTeam", "CRITRAWKETS", "Crowbar", "CryBaby", "CrySomeMore", "C++", "JS", "GMS", "DeadHead", "Delicious Cake", "Divide by Zero", "Dog", "Force of Nature", "Freakin' Unbelievable", "Gentlemanne of Leisure", "GENTLE MANNE of LEISURE", "GLaDOS", "Glorified Toaster with Legs", "Grim Bloody Fable", "GutsAndGlory!", "Hat-Wearing MAN", "Headful of Eyeballs", "Herr Doktor", "HI THERE", "Hostage", "Humans Are Weak", "H@XX0RZ", "I LIVE!", "It's Filthy in There!", "IvanTheSpaceBiker", "Kaboom!", "Kill Me", "LOS LOS LOS", "Maggot", "Mann Co.", "Me", "Mega Baboon", "Mentlegen", "MindlessElectrons", "MoreGun", "Nobody", "Nom Nom Nom", "NotMe", "Numnutz", "One-Man Cheeseburger Apocalypse", "Poopy Joe", "Pow!", "RageQuit", "Ribs Grow Back", "Saxton Hale", "Screamin' Eagles", "SMELLY UNFORTUNATE", "SomeDude", "Someone Else", "Soulless", "Still Alive", "TAAAAANK!", "Target Practice", "ThatGuy", "The Administrator", "The Combine", "The Freeman", "The G-Man", "THEM", "Tiny Baby Man", "Totally Not A Bot", "trigger_hurt", "WITCH", "ZAWMBEEZ", "Ze Ubermensch", "Zepheniah Mann", "0xDEADBEEF", "10001011101"];
    var index = irandom(array_length_1d(usernames) - 1);

	// Adding variable names if another name already exists.
    var randomConstructors = [".", ".", "?", "!", "!", " !", " Gaming", " Gamer", " Gaming", " Gaming", " GG", "gg", "$", "@", "_", "__", "__", "___", " :D", " :D", " -_-", "*", " Again", " Again", " again", " Bro", " buddy", "%", " 2", " 3", " 4", " the 2nd", " the 3rd", " Probably", " was taken", " was taken", " Was Taken", " Was Taken", " :)", " ()", "()", "_xX", "Xx", "360", "15215", "64", "1", "100", "1000", "10000", "K", "2K", "7", "14", "314", "00", "0", "000", "000000", "0x48", "x2"];
    var randomConstructorsIndex = irandom(array_length_1d(randomConstructors) - 1);

    var chosenUsername = usernames[index];

    // Check if the username is already in the global player list
    if ds_list_find_index(global.playerList, chosenUsername) >= 0 {
        // If the username exists, append a constructor
        chosenUsername += randomConstructors[randomConstructorsIndex];
		show_debug_message("#script_username: Existing name detected! Using constructor...");
    }

    // Add the final username to the global player list
    ds_list_add(global.playerList, chosenUsername);

    return chosenUsername;
}
