/*
    Author:
        Dmitry Loac

    Description:
        Teleport untis.

    Parameters:
        0: array - units.
        1: array - position.

    Example:
        [[player], getMarkerPos "TARGET"] call lc_fnc_teleport;
*/

// TODO: Add other parameters.

private [
    "_position",
    "_units",
    "_places"
];

// Unit list.
_units = _this select 0;

// Target position.
_position = _this select 1;

// Find teleport places.
_places = selectBestPlaces [_position, 25, "meadow+trees", 5, count _units];

// Teleport.
{
    _x setPos ((_places call BIS_fnc_arrayPop) select 0);
} forEach _units;