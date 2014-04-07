/*
    Author:
        Dmitry Loac.

    Description:
        Hide markers by color.

    Parameters:
        0: array - colors of marker.

    Example:
        ["ColorOrange", "ColorRed"] call lc_fnc_hideMarkersByColor;
*/

{
    {
         _x setMarkerAlpha 0;
    } forEach ( [_x] call lc_fnc_getMarkersByColor );
} forEach _this;

true;