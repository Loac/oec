/*
    Description:
        Initialisation teleport by click on map.

    Example:
        _null = player addAction ["Teleport", "devel\dev_clickTeleport.sqf"];
*/

private [
    "_units",
    "_places"
];

openMap [true, false];

onMapSingleClick {
    switch (playerSide) do {
        case outpost: { [outpostUnits, _pos] call lc_fnc_teleport };
        case assault: { [assaultUnits, _pos] call lc_fnc_teleport };
    };

    openMap [false, false];
    onMapSingleClick {};
};