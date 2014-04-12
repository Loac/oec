/*
    Author:
        Dmitry Loac.

    Description:
        Teleport unit to start positions.

    Global variables:
        outpostPosition
        outpostUnits
        assaultPosition
        assaultUnits
*/

// TODO: Teleport by groups.
// TODO: Rotate all units each group to leader formation.

// Find places and teleport all outpost units.
[outpostUnits, outpostPosition] call lc_fnc_teleport;

// Find places and teleport all assault units.
[assaultUnits, assaultPosition] call lc_fnc_teleport;