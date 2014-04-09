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

private [
  "_position"
];

// Set freeze zone parameters.
switch (playerSide) do {
    case outpost: { _position = outpostPosition };
    case assault: { _position = assaultPosition };
};

// Add marker for freeze.
[
    "", _position, nil, [freezeSize, freezeSize], "SolidBorder", nil, FREEZE_MARKER_COLOR, 0.5
] call lc_fnc_addMarkerShape;
