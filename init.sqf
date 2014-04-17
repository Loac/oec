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
        outpostTimerRemaining
        outpostUnits
        assaultUnits
        outpostPosition
        assaultPosition
        outpostReady
        assaultReady
        freezeSize
        environment

    Params variable:
        outpostDistance
        outpostTimer
        outpostWinRatio
        assaultWinRatio
        freezeTime
        envSeason
        envTime
        envOvercast
        envFog
        envRain
        aiEnable
*/

// Enable devel options.
if (false) then {
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

// Outpost timer remaining.
outpostTimerRemaining = 0;

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

// Outpost and start position for assault.
outpostPosition = [];
assaultPosition = [];

// Environment settings.
environment = [];

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


/*
    Перемещение гражданских

    Параметр времени удержания

    Установить условия победы
        Для обороны
            С истечением заданного времени, на объекте все еще есть необходимое соотношение сил обороны.
        Для нападения
            Присутсвие войск обороны на объекте меньше необходимого соотношения более минуты.

    Триггеры.

    Брифинг.

    Параметр спавна транспорта.

    Спавн транспорта.

    Расширенное описание объектов для брифинга.
*/