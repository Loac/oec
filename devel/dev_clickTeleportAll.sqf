/*
    Description:
        Initialisation teleport by click on map.

    Global variables:
        outpost
        assault

    Example:
        _null = player addAction ["Teleport", "devel\dev_clickTeleport.sqf"];
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