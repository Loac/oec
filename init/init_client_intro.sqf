/*
    Description:
        Show intro.

    Global variables:
        outpostArea
*/

private [
    "_color",
    "_text",
    "_position"
];

// Wait for server finding outpost position.
waitUntil { not (outpostArea == "") };

// Set color.
_color = sideUnknown call BIS_fnc_sideColor;

// Set alpha color.
_color set [3, 0.7];

// Params.
_text = markerText outpostArea;
_position = markerPos outpostArea;

// Position, text, altitude, radius, degrees viewing angle, clockwise movement, set icons.
[
    _position,
    format [localize "STR_OEC_intro_object_name", _text], 400, 200, random 360, 4,
    [
        ["\a3\ui_f\data\map\markers\nato\o_unknown.paa", _color, _position, 1, 1, 0, _text, 0]
    ]
] call BIS_fnc_establishingShot;