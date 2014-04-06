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

  See:
    ---
*/

private [
    "_areaMarkers",
    "_excludeMarkers",
    "_maxTry",
    "_position",
    "_positionCandidate",
    "_area"
];

// Areas for finding position
_areaMarkers = _this select 0;

// Exclude areas.
_excludeMarkers = _this select 1;

// Max try for finding position.
_maxTry = [_this, 2, 50] call BIS_fnc_param;

// Valid position. Result of function.
_position = [0, 0];

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

    // If candidate is valid.
    if (count _positionCandidate > 0) exitWith {
      _position = _positionCandidate;
    };
};

// Return.
_position;