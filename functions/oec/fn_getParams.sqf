/*
    Author:
        Dmitry Loac.

    Description:
        Load config parameters.

    Global variables:
        paramsArray
        params

    See:
        rqd_fnc_getParam
 */

private [
    "_value",
    "_name"
];

// New global variable for save name parameters.
params = [];

for "_index" from 0 to (count paramsArray) - 1 do {
    _name = configName ((missionConfigFile >> "Params") select _index);
    _value = paramsArray select _index;

    params = params + [_name];
};