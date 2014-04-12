/*
  Author:
    ---

  Description:
    ---

  Global variables:
    ---

  Example:
    ---

  See:
    ---
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

    // Hide player's waypoints
    // { _x setWaypointVisible false } forEach (waypoints group BIS_inf + waypoints BIS_BLU_group2);
//     disableSerialization;
//     (findDisplay 37 displayCtrl 51) ctrlmapAnimAdd [1, 0.2, markerPos "ASSAULT"];
//     ctrlmapAnimCommit (findDisplay 37 displayCtrl 51);

    // Set markers for player by side.
    [] execVM "init\init_client_markers.sqf";

// Wait to start mission.
waitUntil { startMission };

    // Disable AI.
    [false] call lc_fnc_enableAI;

    // Set environment.
    [environment] call lc_fnc_setEnvironment;

    // Show intro.
    _handle = [] execVM "init\init_client_intro.sqf"; waitUntil { scriptDone _handle };

    // Blind player on prepare mission.
    ["off", localize "STR_OEC_please_stand_by"] call lc_fnc_fade;

    // Unparalyze player.
    player enableSimulation true;

    [] execVM "init\init_client_infoText.sqf";

    // Enable tags.
    [] execVM "init\init_client_tags.sqf";

    // Enable freeze timer.
    [] execVM "init\init_client_freeze.sqf";

    // Add radio commands.
    [] execVM "init\init_client_radio.sqf";

    // Remove setting markers.
    [OUTPOST_MARKER_COLOR, EXCLUDE_MARKER_COLOR, DISABLE_MARKER_COLOR] call lc_fnc_deleteMarkersByColor;

    // Init complete, now player can see and move.
    ["in"] call lc_fnc_fade;

    // Enable devel options.
    if (devel) then {
        [] execVM "init\init_client_devel.sqf";
    };