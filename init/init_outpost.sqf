/*
    Author:
        Dmitry Loac

    Description:
        Find place for outpost.

    Global variables:
        outpostPosition
        outpostUnits
        outpostArea
        OUTPOST_MARKER_COLOR

    Example:
        [] execVM "init\init_outpost.sqf";

    See:
        https://community.bistudio.com/wiki/findEmptyPosition
        https://community.bistudio.com/wiki/selectBestPlaces
        https://community.bistudio.com/wiki/Ambient_Parameters
*/

private [
    "_outpostMarkers",
    "_outpostArea",
    "_outpostPlaces",
    "_excludeMarkers"
];

// Find outpost markers.
_outpostMarkers = [OUTPOST_MARKER_COLOR] call lc_fnc_getMarkersByColor;

// Select one.
_outpostArea = _outpostMarkers call BIS_fnc_selectRandom;

// Get Exclude areas.
_excludeMarkers = [EXCLUDE_MARKER_COLOR] call lc_fnc_getMarkersByColor;

// Try to find some point for make teleport places.
outpostPosition = [[_outpostArea], _excludeMarkers] call lc_fnc_getPositionInMarkers;

// Add outpost marker for all users.
outpostArea = [
    "OBJECT",
    markerPos _outpostArea,
    markerShape _outpostArea,
    markerSize _outpostArea, "SolidBorder",
    markerDir _outpostArea,
    OBJECT_MARKER_COLOR, 0.5,
    markerText _outpostArea
] call lc_fnc_addMarkerShape;

// Add marker for freeze zone outpost.
[
    "OUTPOST", outpostPosition, nil, [freezeSize, freezeSize], "SolidBorder", nil, FREEZE_MARKER_COLOR, 0.5
] call lc_fnc_addMarkerShape;