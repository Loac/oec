/*
  Author:
    Dmitry Loac

  Description:
    Get random position around marker.

  Parameters:
    0: string - marker.
    1: integer - distance.
    2: array - markers with excludes areas.
    3: boolean - safe position.
    4: integer (optional) - max try.

  Example:
    [["Outpost 1"], 50, ["Exclude 1", "Exclude 2"]] call lc_fnc_getPositionAroundMarker;

  See:
    ---
*/

private [
    "_marker", "_distance", "_excludeMarkers", "_safe", "_maxTry",
    "_mPosX", "_mPosY",
    "_mSizeX", "_mSizeY",
    "_mDir",
    "_tPosX", "_tPosY",
    "_dir",
    "_position"
];

// Marker.
_marker = _this select 0;

// Distance to finding position.
_distance = _this select 1;

// Exclude areas.
_excludeMarkers = [_this, 2, []] call BIS_fnc_param;

// Check for safe position..
_safe = [_this, 3, true] call BIS_fnc_param;

// Max try for finding position.
_maxTry = [_this, 4, 50] call BIS_fnc_param;

// Valid position. Result of function.
_position = [0, 0];

// Marker parameters.
_mPosX = markerPos _marker select 0;
_mPosY = markerPos _marker select 1;
_mSizeX = markerSize _marker select 0;
_mSizeY = markerSize _marker select 1;
_mDir = markerDir _marker;
_mShape = markerShape _marker == "RECTANGLE";

// Find valid position.
for "_i" from 0 to _maxTry -1 do {

    // Rectangle.
    _vector = if (_mShape) then {
        _tPosX = _mSizeX + _distance;
        _tPosY = _mSizeY + _distance;

        if (round random 1 > 0) then {
            // _tPosX or -_tPosX.
            _tPosX = (_tPosX * 2 * round random 1) - _tPosX;
            // Random axis Y.
            _tPosY = random (_tPosY * 2) - _tPosY;
        }
        else {
            // Random axis X.
            _tPosX = random (_tPosX * 2) - _tPosX;
            // _tPosY or -_tPosY.
            _tPosY = (_tPosY * 2 * round random 1) - _tPosY;
        };

        // Return value.
        [_tPosX, _tPosY];
    }
    else {
        _dir = random 360;

        [
            sin _dir * (_distance + _mSizeX),
            cos _dir * (_distance + _mSizeY)
        ];
    };

    // Rotate according to area.
    _vector = [_vector, -_mDir] call bis_fnc_rotateVector2D;

    // Convert to world coordinates.
    _positionCandidate = [
        _mPosX + (_vector select 0),
        _mPosY + (_vector select 1)
    ];

    // Check for excludes.
    {
        if ([_x, _positionCandidate] call BIS_fnc_inTrigger) exitWith {
            _positionCandidate = [];
        };
    } forEach _excludeMarkers;

    // If need chek safe position.
    if (_safe and count _positionCandidate > 0) then {
        _positionCandidate = _positionCandidate isFlatEmpty [];
    };

    // If candidate is valid.
    if (count _positionCandidate > 0) exitWith {
      _position = _positionCandidate;
    };
};

// Return.
_position;