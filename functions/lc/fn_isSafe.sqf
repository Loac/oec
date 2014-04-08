/*
  Author:
    Dmitry Loac

  Description:
    BIS function very strange work with checks positions.

  Parameters:
    ---

  Global variables:
    ---

  Example:
    ---

  See:
    ---
*/

private [
    "_position",
    "_result"
];

_position = _this select 0;

// Try to find safe position.
_position = _position isFlatEmpty [];

// If find empty position.
if (count _position > 0) then {
  _result = true;
}
else {
  _result = false;
};

// Return.
_result;