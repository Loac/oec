 /*
    Author:
        Dmitry Loac.

    Description:
  		Get random value from parameter.
*/

private [
	"_envName",
	"_availableValues"

];

_envName = _this select 0;

// Get available values.
_availableValues = getArray (missionConfigFile >> "Params" >> _envName >> "values");

// Return. Select one.
_availableValues select ([1, (count _availableValues - 1)] call BIS_fnc_randomInt);