/*
    Author:
        Dmitry Loac

    Description:
        Server initialization.
*/

// Load params.
_handle = [] execVM "init\init_params.sqf"; waitUntil { scriptDone _handle };

// Outpost initialization procedures.
_handle = [] execVM "init\init_outpost.sqf"; waitUntil { scriptDone _handle };

// Assault initialization procedures.
_handle = [] execVM "init\init_assault.sqf"; waitUntil { scriptDone _handle };

// Wait to start mission.
waitUntil { time > 0 };

// Init sides.
_handle = [] execVM "init\init_units.sqf"; waitUntil { scriptDone _handle };

// Init environment.
_handle = [] execVM "init\init_environment.sqf"; waitUntil { scriptDone _handle };

// Teleport units.
_handle = [] execVM "init\init_positions.sqf"; waitUntil { scriptDone _handle };

// AI init.
[] execVM "init\init_ai.sqf";

// Init freeze time.
[] execVM "init\init_freeze.sqf";

// Init arbiter.
[] execVM "init\init_arbiter.sqf";

// Server complete initialization state.
[
    ["outpostArea"],
    ["outpostPosition"],
    ["assaultPosition"],
    ["environment"],
    ["aiEnable"],
    ["startMission", true]
] call lc_fnc_broadcast;

// Post freeze time initialization.
// waitUntil { freezeTime < 0 };