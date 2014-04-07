/*
  Author:
    Dmitry Loac

  Description:
    Main initialization.

  Global variables:
    serverState
    outpost
    assault
    outpostUnits
    assaultUnits
    outpostArea
    assaultArea
*/

/*
    Global variables.
*/

// Define const.
OUTPOST_MARKER_COLOR = "ColorOrange";
EXCLUDE_MARKER_COLOR = "ColorRed";

// Flag mission start.
startMission = false;

// Role of sides.
// TODO: It must be selectable.
outpost = west;
assault = east;

// Units by role. See: init_units.sqf
outpostUnits = [];
assaultUnits = [];

// Groups by role.
// outpostGroups = [];
// assaultGroups = [];

// Marker for outpost.
// It parameters will be used for make triggers, start position and etc.
outpostArea = [];

// Start position of assault.
assaultArea = [];

// Temp.
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