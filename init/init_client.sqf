/*
  Author:
    ---

  Description:
    ---

  Global variables:
    ---

  Example:
    ---

  See:
    ---
*/

/*
    Magic.
*/
waitUntil { not isNull Player and isPlayer Player };

// Blind player on prepare mission.
// ["off", localize "STR_OEC_please_stand_by"] call lc_fnc_fade;

"serverState" addPublicVariableEventHandler {
  hint format [
    "%1 has been updated to: %2",
    _this select 0,
    _this select 1
  ]
};

// Emulate addPublicVariableEventHandler for single player.
_done = false;

waitUntil {

    switch (serverState) do {
      case STATE_INIT: {
        // Телепорт.
        // Установка погоды.

        // Disable AI.
        _handle = [false] call lc_fnc_enableAI;

        // Enable tags.
        _handle = [] execVM "init\init_client_tags.sqf";

        STATE_INIT = -1;

        // Remove setting markers.
//        _handle = [OUTPOST_MARKER_COLOR] call lc_fnc_deleteMarkersByColor;
//        _handle = [EXCLUDE_MARKER_COLOR] call lc_fnc_deleteMarkersByColor;
      };
    };

  _done;
};


//execVM "A3\Missions_F_EPA\Campaign_shared\Scripts\zoneRestriction_warn_A.sqf"
//execVM "A3\Missions_F_EPA\Campaign_shared\Scripts\zoneRestriction_punish_A.sqf"


// [format ["%1_blackScreen", missionName], false] call BIS_fnc_blackOut;
// enableRadio false; BIS_inf enableSimulation false;
// format ["%1_disabledSave", missionName] call BIS_fnc_disableSaving;

//["in"] call sandbox_fnc_fade;


 // this setCaptive true;
 // {this disableAI _x} forEach ["ANIM", "AUTOTARGET", "FSM", "MOVE", "TARGET"];
 // removeAllWeapons this;
 // removeAllAssignedItems this;
 // removeAllItems this;
 // this unlinkItem "NVGoggles";
 // removeHeadgear this;
 // removeGoggles this;
 // this setBehaviour "CARELESS";
 // this setCombatMode "BLUE";
 // this attachTo [BIS_logic1, [0,0,0]]


// test = call BIS_fnc_worldArea;
// testPos = test call BIS_fnc_randomPosTrigger;
// player setPos testPos;





// waitUntil {
//   time > 2;
// };

//   myTrigger1 = [objNull, "Outpost 1"] call BIS_fnc_triggerToMarker;

//   myTrigger2 = [objNull, "Outpost 2"] call BIS_fnc_triggerToMarker;

//   _count = 0;
//   while {_count < 99} do {
//     _pos = myTrigger1 call BIS_fnc_randomPosTrigger;
//     _valid = [myTrigger2, _pos] call BIS_fnc_inTrigger;

//     if (not _valid) then {
//       [_pos, "ColorRed"] call rqd_fnc_testMarker;
//       _count = _count + 1;
//     };

//   };

// hint 'Done';