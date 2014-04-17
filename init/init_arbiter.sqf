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
*/

private [
    "_winner",
    "_scenario",
    "_ratio",
    "_outpostRatio",
    "_assaultRatio"
];

_winner = sideLogic;
_scenario = "";

waitUntil {
    sleep 1;

    // Update ratio.
    _ratio = [outpostUnits, assaultUnits] call lc_fnc_ratio;
    _outpostRatio = _ratio select 0;
    _assaultRatio = _ratio select 1;

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
    if (outpostTimerRemaining < 0) then {
        _scenario = "outpostWinTime";
        _winner = outpost;
    };

    // Wait while _winner is not defined.
    not (_winner == sideLogic);
};

// End of misson.
[[_winner, _scenario], "lc_fnc_endMission"] spawn BIS_fnc_MP;

// Find, activate and delete trigger.
// trg = (allMissionObjects "EmptyDetector") select 0;
// trg setTriggerStatements ["true", "hint 'trigger on'", "hint 'trigger off'"];
// deleteVehicle trg;