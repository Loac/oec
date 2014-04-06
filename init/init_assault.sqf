/*
  Author:
    Dmitry Loac

  Description:
    Find place for assault.
    Teleport units.

  Global variables:
    assaultArea
    assaultUnits
    outpostDistance

  Example:
    _handle = [] execVM "init\init_assault.sqf";

  See:
    ---
*/

// Find place for assault around outpost in defined distance.

for "_i" from 0 to 50 do {
    _pos = [[[getMarkerPos "Outpost 2", 100]]] call BIS_fnc_randomPos;
    [_pos, "ColorBlack"] call oec_fnc_testMarker;
};

