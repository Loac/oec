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

    Params variable:
        outpostDistance
        freezeTime
        envSeason
        envTime
        envOvercast
        envFog
        envRain
        aiEnable
*/

// Devel.
devel = true;

// Debug.
if (devel) then {
    dblog = compile preprocessFile "devel\dev_dblog.sqf";
    ["", "clear"] call dblog;
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

CLIENT_STATE_CONNECTED = 1; // Connected.

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
    Параметр времени удержания

    Параметры необходимого соотношения войск для победы для каждой из сторон.

    Установить условия победы
        Для обороны
            С истечением заданного времени, на объекте все еще есть войска обороны.
            Соотношение сил в пользу обороны.
        Для нападения
            Присутсвие войск обороны на объекте меньше необходимого соотношения более минуты.
            Соотношение сил в пользу нападения.

    Арбитр, который следит за условиями победы и порожения.

    Триггеры.

    Брифинг.

    Параметр спавна транспорта.

    Спавн транспорта.

    Расширенное описание объектов для брифинга.
*/