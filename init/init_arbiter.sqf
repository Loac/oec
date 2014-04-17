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
    "_assaultRatio",
    "_outpostTimerStart",
    "_outpostTimerRemaining"
];

_winner = sideLogic;
_scenario = "";
_outpostTimerStart = time;
_outpostTimerRemaining = 0;

// Outpost capture ratio.
trgOutpostCaptureRatio = {
    _east = east countSide thisList;
    _west = west countSide thisList;

    hint format["%1", 100 / (_east + _west) * _east];
};

_trigger = [objNull, "OBJECT"] call BIS_fnc_triggerToMarker;
_trigger setTriggerActivation["ANY", "PRESENT", true];
_trigger setTriggerStatements["[] call trgOutpostCaptureRatio; false;", "", ""];

// Run outpost timer.
// [] spawn {
//     // Save time of start mission without freeze time.
//     _startTime = time;

//     waitUntil {
//         sleep 1;

//         outpostTimerRemaining = outpostTimer + _startTime - time;

//         outpostTimerRemaining < 0;
//     };
// };

waitUntil {
    sleep 1;

    // Update timer.
    _outpostTimerRemaining = outpostTimer + _outpostTimerStart - time;

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
    if (_outpostTimerRemaining < 0) then {
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