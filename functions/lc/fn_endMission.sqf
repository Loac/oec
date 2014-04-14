 /*
    Author:
        Dmitry Loac.

    Description:
  		Initialize of end mission with parameters for each sides.

    See:
        playerSide
        side group player
        BIS_fnc_MP

    Example:
        [west, "westHoldTarget"] call rqf_fnc_endMission;
    	[[west, "westHoldTarget"], "rqf_fnc_endMission"] spawn BIS_fnc_MP;
*/

private [
	"_winner",
	"_scenario",
	"_debriefing",
	"_isVictory"
];

// Winner side, west or east.
_winner = _this select 0;

// Scenario.
_scenario = _this select 1;

// Victory flag.
_isVictory = (playerSide == _winner);

// Final (see cfgDebriefing.hpp).
if (_isVictory) then {
    _debriefing = "WIN_" + _scenario;
}
else {
    _debriefing = "LOSE_" + _scenario;
};

// Initialisation end mission.
[_debriefing, _isVictory, true] call BIS_fnc_endMission;