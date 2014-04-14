/*
    Description:
        Initialisation teleport by click on map.

    Example:
        player addAction ["Teleport", "devel\dev_clickTeleportAll.sqf"];
*/

private [
    "_units"
];

openMap [true, false];

onMapSingleClick {
    {
        if (playerSide == side _x) then {
            _units = _units + [_x];
        };

        [_units, _pos] call lc_fnc_teleport
    } forEach allUnits;

    openMap [false, false];
    onMapSingleClick {};
};