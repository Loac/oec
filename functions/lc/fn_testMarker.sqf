/*
  Description:
    Create test marker for debug functions.

  Parameters:
    0: array - position.
    1: string - color marker.

  Example:
    for "_i" from 0 to 50 do {
        _position = [random 100, random 100];
        [_position, "ColorBlack"] call lc_fnc_testMarker;
    };
*/

private [
    "_position",
    "_color",
    "_marker"
];

_position = _this select 0;
_color = _this select 1;

_marker = createMarker [(format["%1", _position]), _position];
_marker setMarkerColor (_color);
_marker setMarkerBrush "Solid";
_marker setMarkerShape "ELLIPSE";
_marker setMarkerSize [3, 3];