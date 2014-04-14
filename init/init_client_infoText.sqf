/*
    Description:
        Show info text about location.
*/

_world = toUpper(worldName);

_nearestCity = nearestLocations [getPos player, ["NameCityCapital", "NameCity", "NameVillage", "NameLocal"], 1000];

_town = localize "STR_LOCATION_WILDERNESS";

if (count _nearestCity > 0) then {
    _town = text (_nearestCity select 0);
};

_first = [_world, _town] spawn BIS_fnc_infoText;