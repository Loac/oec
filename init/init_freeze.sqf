/*
    Author:
        Dmitry Loac.

    Description:
        Init freeze timer.

    Global variables:
        freezeTime
        outpostReady
        assaultReady
*/

waitUntil {
    sleep 1;

    // Decrease value timer and publich it.
    [["freezeTime", freezeTime - 1]] call lc_fnc_broadcast;

    // Skip freeze time if both sides agree.
    if (freezeTime > 5 and outpostReady and assaultReady) then {
        freezeTime = 5;
    };

    // Wait for timer is over or both sides is ready.
    freezeTime < 0;
};

/*
    Post freeze time actions.
*/

// Delete freeze zone markers.
[FREEZE_MARKER_COLOR] call lc_fnc_deleteMarkersByColor;

// Enable AI.
if (aiEnable) then {
    [true] call lc_fnc_enableAI;
};