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

private [
  "_excludeMarkers",
  "_assaultPlaces"
];

// Get Exclude areas.
_excludeMarkers = [EXCLUDE_MARKER_COLOR] call lc_fnc_getMarkersByColor;

// Try to find some point for make teleport places.
assaultPosition = [outpostArea, outpostDistance, _excludeMarkers] call lc_fnc_getPositionAroundMarker;