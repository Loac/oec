/*
    Author:
        Dmitry Loac.

    Global variables:
        outpost
        assault
        outpostPosition
        assaultPosition
        freezeSize

    Description:
        Client side procedures in freeze time.
*/

private [
    "_playerPosition",
    "_freezePosition",
    "_freezeRange",
    "_freezeDir"
];

// Set freeze zone parameters.
switch (playerSide) do {
    case outpost: { _freezePosition = outpostPosition };
    case assault: { _freezePosition = assaultPosition };
};

_freezeRange = freezeSize;

// Add marker for freeze.
[
    "", _freezePosition, nil, [freezeSize, freezeSize], "SolidBorder", nil, FREEZE_MARKER_COLOR, 0.5
] call lc_fnc_addMarkerShape;

// Show timer.
[] execVM "ui\ui_freezeTimer.sqf";

// Wait freezeTime is over.
waitUntil {
    _playerPosition = position player;

    // If player leave of the freeze area.
    if (_playerPosition distance _freezePosition > _freezeRange) then {

        // Fade out screen.
        ["out", localize "STR_OEC_please_wait_start_mission", 0.5] call lc_fnc_fade;

        // Wait fade out, before set position.
        sleep 1;

        // Get direction to center of start position.
       _freezeDir = ([_playerPosition, _freezePosition] call bis_fnc_dirTo);

        // Move player back.
        player setPos [
            ((_freezePosition select 0) + (sin (_freezeDir + 180)) * (_freezeRange - 40)),
            ((_freezePosition select 1) + (cos (_freezeDir + 180)) * (_freezeRange - 40))
        ];

        // Fade in screen.
        ["in", "", 0.5] call lc_fnc_fade;
    };

    // No need to a lot of checks.
    sleep 1;

    freezeTime < 0;
};

[FREEZE_MARKER_COLOR] call lc_fnc_deleteMarkersByColor;