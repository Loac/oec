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
assaultArea = [outpostArea, 50, _excludeMarkers] call lc_fnc_getPositionAroundMarker;

// Find places for all assault units.
_assaultPlaces = selectBestPlaces [assaultArea, 25, "meadow+trees", 5, count assaultUnits];

// Teleport units.
{
    _x setPos ((_assaultPlaces call BIS_fnc_arrayPop) select 0);
} forEach assaultUnits;