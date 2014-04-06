/*
  Author:
    Dmitry Loac

  Description:
    Get random position in some markers with excludes.

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
    "_excludes",
    "_position",
    "_positionCandidate",
    "_trigger",
    "_area",
    "_valid"
];

// Areas for finding position
_areaMarkers = _this select 0;

// Exclude areas.
_excludeMarkers = _this select 1;

// Max try for finding position.
_maxTry = [_this, 2, 50] call BIS_fnc_param;

// Triggers array with excludes areas.
_excludes = [];

// Valid position. Result of function.
_position = [0, 0];

// Make triggers for work with BIS functions.
{
    _trigger = [objNull, _x] call BIS_fnc_triggerToMarker;
    _excludes = _excludes + [_trigger];

} forEach _excludeMarkers;

// Find valid position.
for "_i" from 0 to _maxTry -1 do {
    // Select random area (marker).
    _area = _areaMarkers call BIS_fnc_selectRandom;

    // Make trigger from marker.
    _area = [objNull, _area] call BIS_fnc_triggerToMarker;

    // Get some point in area.
    _positionCandidate = _area call BIS_fnc_randomPosTrigger;

    // Check for excludes.
    {
        if ([_x, _positionCandidate] call BIS_fnc_inTrigger) exitWith {
            _positionCandidate = [];
        };
    } forEach _excludes;

    if (count _positionCandidate > 0) exitWith {
      _position = _positionCandidate;
    };

    hint format["%1", _i];
};

// Return.
_position;