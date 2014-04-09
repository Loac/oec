/*
  Author:
    Dmitry Loac

  Description:
    Add markers for players.

  Global variables:
    outpostArea
    OBJECT_MARKER_COLOR

  Example:
    [] execVM "init\init_client_markers.sqf";

  See:
    ---
*/

// Add outpost marker.
[
    "",
    markerPos outpostArea,
    markerShape outpostArea,
    markerSize outpostArea, "SolidBorder",
    markerDir outpostArea,
    OBJECT_MARKER_COLOR, 0.5
] call lc_fnc_addMarkerShape;