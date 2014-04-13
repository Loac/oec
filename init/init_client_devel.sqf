/*
  Author:
    Dmitry Loac

  Description:
    Add devel actions.

  Global variables:
    devel
*/

develGodMode = false;

// Teleport.
player addAction ["Teleport", "devel\dev_clickTeleport.sqf"];

// Teleport all.
player addAction ["Teleport all", "devel\dev_clickTeleportAll.sqf"];

// All ready.
player addAction ["All ready", "devel\dev_allReady.sqf"];

// Add god mode.
player addAction ["God mode", "devel\dev_godMode.sqf"];