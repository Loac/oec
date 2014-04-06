//_trigger = [objNull, "Outpost 2"] call BIS_fnc_triggerToMarker;

//_trigger call lc_fnc_randomPosTrigger;

//["Outpost 2"] call lc_fnc_randomPosTrigger;

for "_i" from 0 to 50 do {
    _pos = [[outpostArea], _excludeMarkers] call lc_fnc_getPositionInMarkers;
    [_pos, "ColorBlack"] call oec_fnc_testMarker;
};


// hint format ["%1 %2", _vector, _mShape];