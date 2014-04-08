/*
  Author:
    Dmitry Loac

  Description:
    Find place for outpost.
    Teleport units.

  Global variables:
    outpostPosition
    outpostUnits
    outpostArea
    OUTPOST_MARKER_COLOR

  Example:
    _handle = [] execVM "init\init_outpost.sqf";

  See:
    https://community.bistudio.com/wiki/findEmptyPosition
    https://community.bistudio.com/wiki/selectBestPlaces
    https://community.bistudio.com/wiki/Ambient_Parameters
*/

// Find outpost markers.
_outpostMarkers = [OUTPOST_MARKER_COLOR] call lc_fnc_getMarkersByColor;

// Select one.
_outpostArea = _outpostMarkers call BIS_fnc_selectRandom;

// Get Exclude areas.
_excludeMarkers = [EXCLUDE_MARKER_COLOR] call lc_fnc_getMarkersByColor;

// Try to find some point for make teleport places.
_position = [[_outpostArea], _excludeMarkers] call lc_fnc_getPositionInMarkers;

// Find places for all outpost units.
// TODO: Need check possible empty _position.
_outpostPlaces = selectBestPlaces [_position, 25, "meadow+trees", 5, count outpostUnits];

// Teleport units.
// TODO: Teleport by groups.
// TODO: Rotate all units each group to leader formation.
{
    _x setPos ((_outpostPlaces call BIS_fnc_arrayPop) select 0);
} forEach outpostUnits;

// Remember spawn position for make player markers, triggers, freeze zone and etc.
outpostPosition = _position;

// Remember selected outpost marker for locate assault. See: init_assault.sqf.
outpostArea = _outpostArea;