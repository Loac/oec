/*
    Author:
        Dmitry Loac.

    Description:
        Get value of parameter by name.

    Global variables:
        paramsArray
        params

    See:
        rqd_fnc_getParams
*/

private [
    "_index"
];

// Find index of parameter.
_index = params find (_this select 0);

// If got it.
if (_index > -1) then {
    // Return value.
    paramsArray select _index;
}
else {
    // Or "nothing".
    nil;
};
