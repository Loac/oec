/*
    Author:
        Dmitry Loac.

    Description:
        Creates icon marker with given params.

    Parametes:
        0: Name (optional). If empty, it will be position.
        1: Position.
        2: Shape (optional).
        3: Size (optional).
        4: Brush (optional).
        5: Direction (optional).
        6: Color (optinal).
        7: Alpha (optinal).
        8: Text (optional).

    Example:
        ["MARKER", position player, nil, nil, nil, 45, "ColorRed", 0.7] call lc_fnc_addMarkerShape;
        ["", position player, "ELLIPSE", [20, 20], nil, nil, "ColorBlack"] call lc_fnc_addMarkerShape;

    See:
        https://community.bistudio.com/wiki/createMarker
        https://community.bistudio.com/wiki/cfgMarkers
        BIS_fnc_markerCreate.
*/

private [
    "_name", "_position",
    "_shape", "_size", "_dir", "_color", "_type", "_alpha", "_text",
    "_marker"
];

// Parametrs.
_name = _this select 0;
_position = _this select 1;
_shape =  [_this, 2, "ELLIPSE"] call BIS_fnc_param;
_size =  [_this, 3, [10, 10], [[]]] call BIS_fnc_param;
_brush =  [_this, 4, "Solid"] call BIS_fnc_param;
_dir = [_this, 5, 0] call BIS_fnc_param;
_color = [_this, 6, "ColorBlack"] call BIS_fnc_param;
_alpha = [_this, 7, 1] call BIS_fnc_param;
_text = [_this, 8, ""] call BIS_fnc_param;

// If empty name, generate it.
if (_name == "") then {
    _name = format["%1", _position];
};

// Create marker.
_marker = createMarker [_name, _position];

// Set parameters.
_marker setMarkerShape _shape;
_marker setMarkerSize _size;
_marker setMarkerBrush _brush;
_marker setMarkerDir _dir;
_marker setMarkerColor _color;
_marker setMarkerAlpha _alpha;
_marker setMarkerText _text;

// Return.
_marker;