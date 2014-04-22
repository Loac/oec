/*
    Author:
        Dmitry Loac.

    Description:
        Calculate the ratio a to b values.

    Parameters:
        0: integer.
        1: integer.
*/

private [
    "_a",
    "_b",
    "_result"
];

_a = _this select 0;
_b = _this select 1;

_result = 0;

// Ratio by percent.
if (_a + _b > 0) then {
    _result = 100 / (_a + _b) * _a;
};

// Return;
_result;