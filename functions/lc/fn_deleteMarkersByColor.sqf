/*
    Author:
        Dmitry Loac.

    Description:
        Delete markers by color.

    Parameters:
        0: array - colors of marker.

    Example:
        ["ColorOrange", "ColorRed"] call lc_fnc_deleteMarkersByColor;

    See:
        https://community.bistudio.com/wiki/deleteMarker
*/

{
    {
        deleteMarker _x;
    } forEach ( [_x] call lc_fnc_getMarkersByColor );
} forEach _this;

true;