/*
  Author:
    Dmitry Loac

  Description:
    Find place for assault.
    Teleport units.

  Global variables:
    assaultPosition
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

// Find places for all assault units.
_assaultPlaces = selectBestPlaces [_position, 25, "meadow+trees", 5, count assaultUnits];

// Make marker
// outpostArea

// Teleport units.
{
    _x setPos ((_assaultPlaces call BIS_fnc_arrayPop) select 0);
} forEach assaultUnits;

// Remember spawn position for make player markers, triggers, freeze zone and etc.
assaultPosition = _position;