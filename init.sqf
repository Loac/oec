/*
    Author:
        Dmitry Loac

    Description:
        Main initialization.

    Global variables:
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
*/

/*
    Global variables.
*/

// Define const.
OUTPOST_MARKER_COLOR = "ColorOrange";
EXCLUDE_MARKER_COLOR = "ColorRed";

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
outpostArea = [];

// Outpost and start position for assault.
outpostPosition = [];
assaultPosition = [];


/*
    Server Initializations.
*/
if (isServer) then {
    /*
        Server initialization.
    */
    _handle = [] execVM "init\init_server.sqf";
};

if (not isDedicated) then {
    /*
        Client side procedures.
    */
    [] execVM "init\init_client.sqf";

};

// x = [] spawn
// {
//   (findDisplay 37 displayCtrl 51) ctrlmapAnimAdd [1, 0.2, markerPos "Outpost 1"];
//   ctrlmapAnimCommit (findDisplay 37 displayCtrl 51);
// };