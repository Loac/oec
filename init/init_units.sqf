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
    _handle = [] execVM "init\init_units.sqf";
*/

{
    if (aiEnable or isPlayer _x) then {
        switch (side _x) do {
            case outpost: { outpostUnits = outpostUnits + [_x] };
            case assault: { assaultUnits = assaultUnits + [_x] };
        };
    };
} forEach allUnits;