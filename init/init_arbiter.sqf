/*
    Author:
        Dmitry Loac

    Description:
        Monitor conditions of mission.

    Global variables:
        outpost
        assault
        outpostWinRatio
        assaultWinRatio
        assaultHoldRatio
*/

private [
    "_winner",
    "_scenario",
    "_ratio",
    "_outpostRatio",
    "_assaultRatio",
    "_outpostTimerStart",
    "_outpostTimerRemaining"
];

_winner = sideLogic;
_scenario = "";
_outpostTimerStart = time;
_outpostTimerRemaining = 0;

// Outpost capture ratio. Function and Trigger.
assaultHoldRatioUpdate = {
    private ["_outpostUnits", "_assaultUnits"];

    _outpostUnits = outpost countSide thisList;
    _assaultUnits = assault countSide thisList;

    assaultHoldRatio = [_assaultUnits, _outpostUnits] call lc_fnc_ratio;
};

_trigger = [objNull, "OBJECT"] call BIS_fnc_triggerToMarker;
_trigger setTriggerActivation["ANY", "PRESENT", true];
_trigger setTriggerStatements["[] call assaultHoldRatioUpdate; false;", "", ""];

// Start arbiter.
waitUntil {
    sleep 1;

    // Update timer.
    _outpostTimerRemaining = outpostWinTime + _outpostTimerStart - time;

    // Update ratio.
    _outpostUnits = count outpostUnits;
    _assaultUnits = count assaultUnits;

    _outpostRatio = [_outpostUnits, _assaultUnits] call lc_fnc_ratio;
    _assaultRatio = [_assaultUnits, _outpostUnits] call lc_fnc_ratio;

    // Outpost win by ratio.
    if (_outpostRatio > outpostWinRatio) then {
        _scenario = "outpostWinRatio";
        _winner = outpost;
    };

    // Assault win by ratio.
    if (_assaultRatio > assaultWinRatio) then {
        _scenario = "assaultWinRatio";
        _winner = assault;
    };

    // Outpost win by time.
    if (_outpostTimerRemaining < 0) then {
        _scenario = "outpostWinTime";
        _winner = outpost;
    };

    // Assault win by hold ratio.
    if (assaultHoldRatio > assaultWinHoldRatio) then {
        _scenario = "assaultWinHoldRatio";
        _winner = assault;
    };

    hint format["assaultHoldRatio: %1\n _outpostRatio: %2\n _assaultRatio: %3\n _outpostTimerRemaining: %4\n",
        assaultHoldRatio, _outpostRatio, _assaultRatio, _outpostTimerRemaining];


    // Wait while _winner is not defined.
    not (_winner == sideLogic);
};

// End of misson.
[[_winner, _scenario], "lc_fnc_endMission"] spawn BIS_fnc_MP;