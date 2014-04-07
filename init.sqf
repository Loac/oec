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

// Define const.
STATE_UNKNOWN = -1;
STATE_INIT = 0;
STATE_PROGRESS = 1;

OUTPOST_MARKER_COLOR = "ColorOrange";
EXCLUDE_MARKER_COLOR = "ColorRed";

// Global variables.

// Server state.
serverState = STATE_UNKNOWN;

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

// Initializations.

if (isServer) then {
    /*
        Server initialization.
    */
    [] execVM "init\init_server.sqf";
};

if (not isDedicated) then {
    /*
        Client side procedures.
    */
    [] execVM "init\init_client.sqf";

};