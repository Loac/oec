/*
    Description:
        Show player tags.

    Example:
        [] execVM "init\init_client_tags.sqf";
*/

private [
    "_layer",
    "_target"
];

_layer = 3030;

while {alive player} do {
    _target = cursorTarget;

    if ((not isNull _target) and (_target distance player < 15) and (side _target == side player) and (alive _target)) then {
        [
            format["<t size='0.7' color='#ADFF2F' shadow='2'>%1</t>", name _target],
            0, 0.7,
            0.5, 0, 0,
            _layer
        ] spawn BIS_fnc_dynamicText;
    }
    else {
        _layer cutFadeOut 0;
    };

    sleep 0.5;
};