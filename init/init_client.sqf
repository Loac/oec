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

/*
    Magic.
*/
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

// Disable AI.
[false] call lc_fnc_enableAI;

// Show intro.
//_handle = [] execVM "init\init_client_intro.sqf"; waitUntil { scriptDone _handle };

// Blind player on prepare mission.
["off", localize "STR_OEC_please_stand_by"] call lc_fnc_fade;

// Emulate addPublicVariableEventHandler for single player.
[] spawn {
    // Wait server.
    waitUntil { startMission };

    // Unparalyze player.
    player enableSimulation true;

    // Remove setting markers.
    [OUTPOST_MARKER_COLOR, EXCLUDE_MARKER_COLOR, DISABLE_MARKER_COLOR] call lc_fnc_deleteMarkersByColor;

    // Enable tags.
    [] execVM "init\init_client_tags.sqf";

    // Enable freeze timer.
    [] execVM "init\init_client_freeze.sqf";

    // Add radio commands.
    [] execVM "init\init_client_radio.sqf";

    // Init complete, now player can see and move.
    ["in"] call lc_fnc_fade;
};

// "serverState" addPublicVariableEventHandler {
//     hint format [
//         "%1 has been updated to: %2",
//         _this select 0,
//         _this select 1
//     ]
// };

//execVM "A3\Missions_F_EPA\Campaign_shared\Scripts\zoneRestriction_warn_A.sqf"
//execVM "A3\Missions_F_EPA\Campaign_shared\Scripts\zoneRestriction_punish_A.sqf"


// [format ["%1_blackScreen", missionName], false] call BIS_fnc_blackOut;
// enableRadio false; BIS_inf enableSimulation false;
// format ["%1_disabledSave", missionName] call BIS_fnc_disableSaving;

//["in"] call sandbox_fnc_fade;


 // this setCaptive true;
 // {this disableAI _x} forEach ["ANIM", "AUTOTARGET", "FSM", "MOVE", "TARGET"];
 // removeAllWeapons this;
 // removeAllAssignedItems this;
 // removeAllItems this;
 // this unlinkItem "NVGoggles";
 // removeHeadgear this;
 // removeGoggles this;
 // this setBehaviour "CARELESS";
 // this setCombatMode "BLUE";
 // this attachTo [BIS_logic1, [0,0,0]]


// test = call BIS_fnc_worldArea;
// testPos = test call BIS_fnc_randomPosTrigger;
// player setPos testPos;