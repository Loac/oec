/*
  Author:
    ---

  Description:
    ---

  Global variables:
    ---

  Example:
    ---

  See:
    ---
*/

/*
  Оборона и нападение.

  Цель миссии для обороняющихся:
    исключить присутсвие противника в зоне обороны в течении заданного времени.
    уничтожить нападающих.

  Цель миссии для нападающих:
    захватить и удержать указанную область в течении заданного времени.
    уничтожить обораняющихся.
*/

/*
  Сервер.
    Загрузить параметры.
    Транслировать параметры.
    Установить параметры погоды.
    Отключить ботов.
    Найти все маркеры-аванпосты.
    Найти место около аванпоста, для телепорта нападающих.
    Запустить арбитра.
    Созадть тригеры для контроля игры.
    Телепортировать обораняющихся на аванпост.
    Телепортировать нападающих на место старта.
    Запустить фризтайм.

  Клиент.
    Отключить картинку.
    Удалить маркеры-аванпосты.
    Ждать параметры погоды.
    Установить параметры погоды.
    Включить картинку.
*/

// Disable AI.
_handle = [false] call lc_fnc_enableAI;

// Load params.
_handle = [] execVM "init\init_params.sqf"; waitUntil { scriptDone _handle };

// Strange pause for MP.
waitUntil { time > 1 };

// Init sides.
_handle = [] execVM "init\init_units.sqf"; waitUntil { scriptDone _handle };

// Outpost initialization procedures.
_handle = [] execVM "init\init_outpost.sqf"; waitUntil { scriptDone _handle };

// Assault initialization procedures.
_handle = [] execVM "init\init_assault.sqf"; waitUntil { scriptDone _handle };

// Server complete initialization state.
[["startMission", true]] call lc_fnc_broadcast;