/*
    Author:
        Dmitry Loac.

    Description:
        Add command side ready for leader formation.

    Global variables:
        outpostReady
        assaultReady

    See:
        BIS_fnc_codePerformance
        BIS_fnc_addCommMenuItem
        https://community.bistudio.com/wiki/setTriggerActivation
        https://community.bistudio.com/wiki/setTriggerStatements
        https://community.bistudio.com/wiki/Arma_3_Communication_Menu
*/

private [
    "_trigger"
];

// Add radio only for leader formation.
if (isFormationLeader player) then {
    // Action radio.
    trgActivation = {
        switch (playerSide) do {
            case outpost: {
                [["outpostReady", true]] call lc_fnc_broadcast;
            };
            case assault: {
                [["assaultReady", true]] call lc_fnc_broadcast;
            };
        };
    };

    // Trigger for radio.
    _trigger = createTrigger["EmptyDetector", [0, 0, 0]];
    _trigger setTriggerActivation["ALPHA", "PRESENT", true];
    _trigger setTriggerText "Ready";
    _trigger setTriggerStatements["this", "[] call trgActivation", ""];
};

