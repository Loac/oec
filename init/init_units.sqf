/*
    Author:
        Dmitry Loac

    Description:
        Init units by side.

    Parameters:
        ---

    Global variables:
        aiEnable
        outpost
        assault
        outpostUnits
        assaultUnits

    Example:
        [] execVM "init\init_units.sqf";
*/

// Function: update unit arrays.
updateUnits = {
    outpostUnits = [];
    assaultUnits = [];

    {
        // If AI is enabled, then consider bots to.
        if (aiEnable or isPlayer _x) then {
            // FIX: If player kills an ally, he becomes enemy side.
            switch (side _x) do {
                case outpost: { outpostUnits = outpostUnits + [_x] };
                case assault: { assaultUnits = assaultUnits + [_x] };
            };
        };
    } forEach allUnits;
};

{
    // Update unit arrays after each murder.
    _x addMPEventHandler ["MPKilled", { [] spawn updateUnits } ];
} forEach allUnits;

// First count.
[] call updateUnits;