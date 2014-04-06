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
    "_try",
    "_trigger",
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
_position = [];

// Count of tries finding positions.
_try = 0;

// Make triggers for work with BIS functions.
{
    _trigger = [objNull, _x] call BIS_fnc_triggerToMarker;
    _excludes = _excludes + [_trigger];

} forEach _excludeMarkers;

// Find valid position.
// TODO: convert to for cycle.
waitUntil {
    // Flag for valid position.
    _valid = true;

    // Select random area (marker).
    _area = _areaMarkers call BIS_fnc_selectRandom;

    // Make trigger from marker.
    _area = [objNull, _area] call BIS_fnc_triggerToMarker;

    // Get some point in area.
    _position = _area call BIS_fnc_randomPosTrigger;

    // Check for excludes.
    {
        if ([_x, _position] call BIS_fnc_inTrigger) exitWith {
            _position = [];
            _valid = false;
        };
    } forEach _excludes;


    // One more try.
    _try = _try + 1;

    // Exit, if valid position.
    _valid or _try > _maxTry -1;
};

// if (not _valid) then {
//     ["%1", "Can't find valid position."] call BIS_fnc_error;
// };

// Return.
_position;