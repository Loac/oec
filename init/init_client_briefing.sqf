/*
    Author:
        Dmitry Loac.

    External variables:
        --

    See:
        BIS_fnc_setTask
        https://community.bistudio.com/wiki/Scripting_Commands_by_Functionality
        https://community.bistudio.com/wiki/Loading_Screens
        https://community.bistudio.com/wiki/Category:Command_Group:_Briefing
        http://arma.at.ua/forum/42-6690-1
*/

private [
    "_date",
    "_hour",
    "_welcome",
    "_intro"
];

switch (playerSide) do {
    case outpost: {
    };

    case assault: {
    };
};

// Check date.
_date = date;
_hour = floor ((random 24) / 6);

// Make intro message.
_welcome = ["Доброй ночи", "Доброе утро", "Добрый день", "Добрый вечер"] select _hour;

_intro = format["

%1, боец. <br/><br/>

Вас приветствует генератор случайного боя. Цель этого задания — удержание и зачистка территории
от предполагаемого противника. <br/><br/>

Расположение зоны удержания, место десантирования, погодные условия и время суток для вас заботливо
подобрала система подготовки солдат к экстремальным условиям. <br/><br/>

Вам необходимо занять указанную <font color='#00FF00' underline='1'><marker name='OBJECT'>область</marker></font> и
удержать ее заданное время или склонить соотношение сил в вашу сторону. <br/><br/>

Под удержанием понимается полное отсутствие в указанной области бойцов противника. Ситуацию, когда в зоне
находится хотя бы один солдат каждой фракции, система будет считать равнозначной и время удержания
засчитываться не будет.

", _welcome];

_handle = player createDiaryRecord ["diary", ["Добро пожаловать", _intro]];