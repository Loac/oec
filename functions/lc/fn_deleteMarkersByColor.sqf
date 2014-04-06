/*
    Author:
        Dmitry Loac.

    Description:
        Delete markers by color.

    Parameters:
        0: string - color of marker.

    Example:
        ["ColorOrange"] call lc_fnc_deleteMarkersByColor;

    See:
        https://community.bistudio.com/wiki/setMarkerColor
*/

private [
    "_color"
];

{
    deleteMarker _x;
} forEach ( _this call lc_fnc_getMarkersByColor );

true;