/*
    Description:
        Switch god mode.

    Example:
        _null = player addAction ["God mode", "devel\dev_godMode.sqf"];
*/

develGodMode = not develGodMode;

player enableFatigue not develGodMode;
player allowDamage not develGodMode;

player sideChat format ["God mode: %1", develGodMode];