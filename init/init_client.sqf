/*
    Author:
        Dmitry Loac

    Description:
        Client initialization.
*/

// Magic.
waitUntil { not isNull Player and isPlayer Player };

    // Disable saving.
    enableSaving [false, false];

    // Radio off.
    enableRadio false;

    // God mod for possible freeze time.
    player allowDamage false;

    // Paralyze player.
    player enableSimulation false;

    // Hide setting markers.
    [OUTPOST_MARKER_COLOR, EXCLUDE_MARKER_COLOR, DISABLE_MARKER_COLOR] call lc_fnc_hideMarkersByColor;

    // Set markers for player and hide waypoints.
    [] execVM "init\init_client_markers.sqf";

// Wait to start mission.
waitUntil { startMission };

    // Disable AI.
    [false] call lc_fnc_enableAI;

    // Set environment.
    [environment] call lc_fnc_setEnvironment;

    // Show intro.
    _handle = [] execVM "init\init_client_intro.sqf"; waitUntil { scriptDone _handle };

    // Unparalyze player.
    player enableSimulation true;

    // Show info about place.
    [] execVM "init\init_client_infoText.sqf";

    // Enable tags.
    [] execVM "init\init_client_tags.sqf";

    // Enable freeze timer.
    [] execVM "init\init_client_freeze.sqf";

    // Add radio commands.
    [] execVM "init\init_client_radio.sqf";

    // Remove setting markers.
    [OUTPOST_MARKER_COLOR, EXCLUDE_MARKER_COLOR, DISABLE_MARKER_COLOR] call lc_fnc_deleteMarkersByColor;