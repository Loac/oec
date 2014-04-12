/*
  Author:
    Dmitry Loac

  Description:
    Init markers for players.

  Global variables:
    outpost
    assault
    OBJECT_MARKER_COLOR

  Example:
    [] execVM "init\init_client_markers.sqf";

  See:
    ---
*/

// Remove markers on enemy start positions.
switch (playerSide) do {
    case outpost: { deleteMarkerLocal "ASSAULT" };
    case assault: { deleteMarkerLocal "OUTPOST" };
};

