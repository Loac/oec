class Params
{
    class outpostDistance
    {
        title = "$STR_OEC_param_outpostDistance";
        values[] = { 600, 900, 1200, 1500 };
        texts[] = { "600", "900", "1200", "1500" };
        default = 900;
    };

    class freezeTime
    {
        title = "$STR_OEC_param_freezeTime";
        values[] = { 0, 30, 60, 90, 120, 180, 300 };
        texts[] = { "Off", "00:30", "01:00", "01:30", "02:00", "03:00", "05:00" };
        default = 180;
    };

    class aiEnable
    {
        title = "$STR_OEC_param_aiEnable";
        values[] = { 0, 1 };
        texts[] = { "Off", "On" };
        default = 1;
    };
};