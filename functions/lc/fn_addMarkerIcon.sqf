/*
    Author:
        Dmitry Loac.

    Description:
        Creates icon marker with given params.

    Parametes:
        0: Name (optional). If empty, it will be position.
        1: Position.
        2: Type (optional).
        2: Text (optional).
        3: Direction (optional).
        4: Color (optinal).
        5: Alpha (optinal).

    Example:
        ["MARKER", position player, "mil_dot", "", 45, "ColorRed", 0.7] call lc_fnc_addMarkerIcon;
        ["", position player, "mil_dot", "Hello World"] call lc_fnc_addMarkerIcon;

    See:
        https://community.bistudio.com/wiki/createMarker
        https://community.bistudio.com/wiki/cfgMarkers
        BIS_fnc_markerCreate.
*/

private [
    "_name", "_position",
    "_type", "_text", "_dir", "_color", "_type", "_alpha",
    "_marker"
];

// Parametrs.
_name = _this select 0;
_position = _this select 1;
_type =  [_this, 2, "mil_dot"] call BIS_fnc_param;
_text =  [_this, 3, ""] call BIS_fnc_param;
_dir = [_this, 4, 0] call BIS_fnc_param;
_color = [_this, 5, "ColorBlack"] call BIS_fnc_param;
_alpha = [_this, 6, 1] call BIS_fnc_param;

// If empty name, generate it.
if (_name == "") then {
    _name = format["%1", _position];
};

// Create marker.
_marker = createMarker [_name, _position];

// Set parameters.
_marker setMarkerType _type;
_marker setMarkerText _text;
_marker setMarkerDir _dir;
_marker setMarkerColor _color;
_marker setMarkerAlpha _alpha;

// Return.
_marker;