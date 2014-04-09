/*
  Author:
    ---

  Description:
    ---

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
    "_variable"
];

_what = _this select 0;

request = [netId player, _what];

publicVariableServer "request";