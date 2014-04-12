/*
    Author:
        Dmitry Loac.

    Description:
        Set environment: fog, day time and etc.

    Example:
        [["envFog", 1], ["envOvercast", 1]] call lc_fnc_setEnvironment;
*/

private [
    "_params",
    "_name",
    "_value"
];

// Get value from parametrs
_params = _this select 0;

{
    _name = _x select 0;
    _value = _x select 1;

    switch (_name) do {
        case "envDate": { setDate _value };                // [year, month, day, hour, minute]
        case "envWind": { setWind _value };                // [x, z, forced]
        case "envFog": { 0 setFog _value };                // 0 to 1
        case "envOvercast": { 0 setOvercast _value };      // 0 to 1
        case "envRain": { 0 setRain _value };              // 0 or 1
        case "envRainbow": { 0 setRainbow _value };        // 0 or 1
    };

} foreach _params;

// Return.
true;