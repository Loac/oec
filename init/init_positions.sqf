/*
    Author:
        Dmitry Loac.

    Description:
        Teleport unit to start positions.

    Global variables:
        outpostPosition
        outpostUnits
*/

private [
    "_places"
];

// Teleport outpost units.

// Find places for all outpost units.
// TODO: Need check possible empty _position.
_places = selectBestPlaces [outpostPosition, 25, "meadow+trees", 5, count outpostUnits];

// TODO: Teleport by groups.
// TODO: Rotate all units each group to leader formation.
{
    _x setPos ((_places call BIS_fnc_arrayPop) select 0);
} forEach outpostUnits;

// Teleport assault units.

// Find places for all assault units.
_places = selectBestPlaces [assaultPosition, 25, "meadow+trees", 5, count assaultUnits];

{
    _x setPos ((_places call BIS_fnc_arrayPop) select 0);
} forEach assaultUnits;