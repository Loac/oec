/*
    Author:
        Dmitry Loac.

    Description:
        Calculate the ratio units.

    Parameters:
        0: array.
        1: array.

    See:
        countSide
        playableUnits
*/

private [
    "_a",
    "_b",
    "_aUnits",
    "_bUnits"
];

_a = _this select 0;
_b = _this select 1;

_aUnits = count _a;
_bUnits = count _b;

// Ratio by percent.
[
    100 / (_aUnits + _bUnits) * _aUnits,
    100 / (_bUnits + _aUnits) * _bUnits
];