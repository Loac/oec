/*
  Author:
    Dmitry Loac

  Description:
    Add devel actions.

  Global variables:
    devel
*/

// Teleport.
player addAction ["Teleport", "devel\dev_clickTeleport.sqf"];

// Teleport all.
player addAction ["Teleport all", "devel\dev_clickTeleportAll.sqf"];

// All ready.
player addAction ["All ready", "devel\dev_allReady.sqf"];