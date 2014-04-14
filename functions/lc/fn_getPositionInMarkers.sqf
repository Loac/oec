/*
    Author:
        Dmitry Loac

    Description:
        Get random position in some markers with excludes.
        For work need fixed version BIS function lc_fnc_randomPosTrigger.

    Parameters:
        0: array - markers for finding position.
        1: array - markers with excludes areas.
        2: integer (optional) - max try for finding position.

    Example:
        _position = [["Outpost 1"], ["Exclude 1", "Exclude 2"]] call lc_fnc_getPositionInMarkers;

*/

private [
    "_areaMarkers",
    "_excludeMarkers",
    "_safe",
    "_maxTry",
    "_position",
    "_positionCandidate",
    "_area",
    "_isSafe"
];

// Areas for finding position
_areaMarkers = _this select 0;

// Exclude areas.
_excludeMarkers = _this select 1;

// Check for safe position..
_safe = [_this, 2, true] call BIS_fnc_param;

// Max try for finding position.
_maxTry = [_this, 3, 50] call BIS_fnc_param;

// Valid position. Result of function.
_position = [0, 0];

// By default position is safe.
_isSafe = true;

// Find valid position.
for "_i" from 0 to _maxTry -1 do {
    // Select random area (marker).
    _area = _areaMarkers call BIS_fnc_selectRandom;

    // Get some point in area.
    _positionCandidate = [_area] call lc_fnc_randomPosTrigger;

    // Check for excludes.
    {
        if ([_x, _positionCandidate] call BIS_fnc_inTrigger) exitWith {
            _positionCandidate = [];
        };
    } forEach _excludeMarkers;

    // If need check safe position.
    if (_safe and count _positionCandidate > 0) then {
        _isSafe = [_positionCandidate] call lc_fnc_isSafe;
    };

    // If candidate is valid.
    if (_isSafe and count _positionCandidate > 0) exitWith {
      _position = _positionCandidate;
    };
};

// Return.
_position;