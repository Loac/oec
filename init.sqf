/*
    Author:
        Dmitry Loac

    Description:
        Quick random attack and defence mission.

    Global variables:
        devel
        startMission
        serverState
        outpost
        assault
        outpostArea
        outpostUnits
        assaultUnits
        outpostPosition
        assaultPosition
        outpostReady
        assaultReady
        freezeSize
        environment
        assaultHoldRatio

    Params variable:
        outpostDistance
        outpostWinTime
        assaultWinHoldRatio
        outpostWinRatio
        assaultWinRatio
        freezeTime
        envSeason
        envTime
        envOvercast
        envFog
        envRain
        aiEnable

    Inline functions:
        updateUnits - init\init_units.sqf
        assaultHoldRatioUpdate - init\init_arbiter.sqf
        trgActivation - init\init_client_radio.sqf
*/

// Enable devel options.
if (true) then {
    [] execVM "init\init_devel.sqf";
};

/*
    Global variables.
*/

// Define const.
OUTPOST_MARKER_COLOR = "ColorOrange";
EXCLUDE_MARKER_COLOR = "ColorRed";
DISABLE_MARKER_COLOR = "ColorBlack";
FREEZE_MARKER_COLOR = "Color1_FD_F";
OBJECT_MARKER_COLOR = "ColorUNKNOWN";

// Flag to mission start.
startMission = false;

// Role of sides.
// TODO: It must be selectable.
outpost = west;
assault = east;

// Units by role. See: init_units.sqf
outpostUnits = [];
assaultUnits = [];

// Flags for early start.
outpostReady = false;
assaultReady = false;

// Size for freeze zone.
freezeSize = 50;

// Groups by role.
// outpostGroups = [];
// assaultGroups = [];

// Selected outpost marker.
outpostArea = "";

// Outpost and assault start position.
outpostPosition = [];
assaultPosition = [];

// Environment settings.
environment = [];

// Ratio assault units in object area.
assaultHoldRatio = 0;

/*
    Initializations.
*/

if (isServer) then {
    /*
        Server initialization.
    */
    _handle = [] execVM "init\init_server.sqf"; waitUntil { scriptDone _handle };
};

if (not isDedicated) then {
    /*
        Client side procedures.
    */
    [] execVM "init\init_client.sqf";
};

// x = [] spawn
// {
//   (findDisplay 37 displayCtrl 51) ctrlmapAnimAdd [1, 0.2, markerPos "ASSAULT"];
//   ctrlmapAnimCommit (findDisplay 37 displayCtrl 51);
// };

// Find, activate and delete trigger.
// trg = (allMissionObjects "EmptyDetector") select 0;
// trg setTriggerStatements ["true", "hint 'trigger on'", "hint 'trigger off'"];
// deleteVehicle trg;

/*
    localize init_client_radio.sqf

    Брифинг.

    Параметр спавна транспорта.

    Спавн транспорта.

    Перемещение гражданских.

    Триггеры на объектах.

    Расширенное описание объектов для брифинга.
*/