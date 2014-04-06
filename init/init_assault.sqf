/*
  Author:
    Dmitry Loac

  Description:
    Find place for assault.
    Teleport units.

  Global variables:
    assaultArea
    assaultUnits
    outpostArea
    outpostDistance

  Example:
    _handle = [] execVM "init\init_assault.sqf";

  See:
    ---
*/

// Get Exclude areas.
_excludeMarkers = [EXCLUDE_MARKER_COLOR] call lc_fnc_getMarkersByColor;

// Try to find some point for make teleport places.
_position = [outpostArea, 50, _excludeMarkers] call lc_fnc_getPositionAroundMarker;


for "_i" from 0 to 99 do {
    _position = [outpostArea, 50, _excludeMarkers] call lc_fnc_getPositionAroundMarker;
    [_position, "ColorBlack"] call oec_fnc_testMarker;
};

// Find places for all outpost units.
// _outpostPlaces = selectBestPlaces [_position, 25, "meadow+trees", 5, count outpostUnits];
