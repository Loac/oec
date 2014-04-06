/*
    Author:
        Dmitry Loac.

    Description:
        Find markers by color.

    Parameters:
        0: string - color of marker.

    Example:
        ["ColorOrange"] call lc_fnc_getMarkers;

    See:
        https://community.bistudio.com/wiki/setMarkerColor
*/

private [
    "_color",
    "_markers"
];

_color = _this select 0;
_markers = [];

{
    // We need only _color markers.
    if (_color == getMarkerColor _x) then {
        _markers = _markers + [_x];
    };

} forEach allMapMarkers;

// Return.
_markers;