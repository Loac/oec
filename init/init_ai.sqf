/*
    Author:
        Dmitry Loac.

    Description:
        Add waypoints for AI.

    Global variables:
        outpostArea
        outpostPosition
        outpostReady
        assaultReady
        freezeTime
        aiEnable

    See:
        https://community.bistudio.com/wiki/Mission_Editor:_Waypoints
        https://community.bistudio.com/wiki/AIBehaviour
        https://community.bistudio.com/wiki/ArmA:_AI_Combat_Modes
        https://community.bistudio.com/wiki/setWaypointType
        https://community.bistudio.com/wiki/CfgAISkill
*/

private [
    "_outpostLeader",
    "_assaultLeader",
    "_waypoint"
];

// Disable AI.
[false] call lc_fnc_enableAI;

// If AI is enabled.
if (aiEnable) then {

    // Flags: player is leader of side.
    _outpostLeader = false;
    _assaultLeader = false;

    {
        // Delete start waypoint.
        deleteWaypoint [_x, 0];

        // Add outpost waypoint.
        _waypoint = _x addWaypoint[markerPos outpostArea, markerSize outpostArea select 0];
        _waypoint setWaypointType "SENTRY";
        _waypoint setWaypointVisible false;
        _waypoint showWaypoint "NEVER";
        _x setBehaviour "COMBAT";
        _x setSpeedMode "FULL";

        // Check player group leader.
        if (isPlayer (leader _x)) then {
            switch (side _x) do {
                case west: { _outpostLeader = true };
                case east: { _assaultLeader = true };
            };
        }
    } forEach allGroups;

    // If no outpost player leader.
    if (not _outpostLeader) then {
        [["outpostReady", true]] call lc_fnc_broadcast;
    };

    // If no assault player leader.
    if (not _assaultLeader) then {
        [["assaultReady", true]] call lc_fnc_broadcast;
    };
};