class Params
{
    class outpostDistance
    {
        title = "$STR_OEC_param_outpostDistance";
        values[] = { 400, 600, 900, 1200, 1500 };
        texts[] = { "400", "600", "900", "1200", "1500" };
        default = 400;
    };

    class outpostWinRatio
    {
        title = "$STR_OEC_param_outpostWinRatio";
        values[] = { 10, 20, 30, 40, 50, 60, 70, 80, 90, 100 };
        texts[] = { "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%" };
        default = 80;
    };

    class assaultWinRatio
    {
        title = "$STR_OEC_param_assaultWinRatio";
        values[] = { 10, 20, 30, 40, 50, 60, 70, 80, 90, 100 };
        texts[] = { "10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%" };
        default = 70;
    };

    class freezeTime
    {
        title = "$STR_OEC_param_freezeTime";
        values[] = { 0, 30, 60, 90, 120, 180, 300 };
        texts[] = { "$STR_OEC_param_value_No", "00:30", "01:00", "01:30", "02:00", "03:00", "05:00" };
        default = 180;
    };

    class envSeason
    {
        title = "$STR_OEC_param_envSeason";
        values[] = { -1, 0, 1, 2, 3 };
        texts[] = { "$STR_OEC_param_value_Random", "$STR_OEC_param_value_Winter", "$STR_OEC_param_value_Spring", "$STR_OEC_param_value_Summer", "$STR_OEC_param_value_Autumn" };
        default = -1;
    };

    class envTime
    {
        title = "$STR_OEC_param_envTime";
        values[] = { -1, 0, 4, 8, 12, 16, 20 };
        texts[] = { "$STR_OEC_param_value_Random", "$STR_OEC_param_value_Dark_night", "$STR_OEC_param_value_Early_morning", "$STR_OEC_param_value_Morning", "$STR_OEC_param_value_Afternoon", "$STR_OEC_param_value_Sundown", "$STR_OEC_param_value_Night" };
        default = -1;
    };

    class envOvercast
    {
        title = "$STR_OEC_param_envOvercast";
        values[] = { -1, 0, 0.25, 0.50, 0.75, 1 };
        texts[] = { "$STR_OEC_param_value_Random", "$STR_OEC_param_value_Clear", "$STR_OEC_param_value_Partly_cloudy", "$STR_OEC_param_value_Cloudy", "$STR_OEC_param_value_Overcast", "$STR_OEC_param_value_Storm" };
        default = -1;
    };

    class envFog
    {
        title = "$STR_OEC_param_envFog";
        values[] = { -1, 0, 0.25, 0.50, 0.75, 1 };
        texts[] = { "$STR_OEC_param_value_Random", "$STR_OEC_param_value_No", "$STR_OEC_param_value_Little", "$STR_OEC_param_value_Middle", "$STR_OEC_param_value_High", "$STR_OEC_param_value_Full" };
        default = -1;
    };

    class envRain
    {
        title = "$STR_OEC_param_envRain";
        values[] = { -1, 0, 1 };
        texts[] = { "$STR_OEC_param_value_Random", "$STR_OEC_param_value_No", "$STR_OEC_param_value_Yes" };
        default = -1;
    };

    class aiEnable
    {
        title = "$STR_OEC_param_aiEnable";
        values[] = { 0, 1 };
        texts[] = { "$STR_OEC_param_value_No", "$STR_OEC_param_value_Yes" };
        default = 1;
    };
};