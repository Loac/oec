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
    // Decrease value timer and publich it.
    [["freezeTime", freezeTime - 1]] call lc_fnc_broadcast;

    // Skip freeze time if both sides agree.
    if (freezeTime > 5 and outpostReady and assaultReady) then {
        freezeTime = 5;
    };

    sleep 1;

    // Wait for timer is over or both sides is ready.
    freezeTime < 0;
};