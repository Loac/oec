/*
    KK's debug_console v3.0 macros
    http://killzonekid.com/arma-console-extension-debug_console-dll-v3-0/
    debug_console.hpp don't work for me.

    Example:
        dblog = compile preprocessFile "devel\dev_dblog.sqf";

        ["Hello world"] call dblog;
        ["Error", "rt"] call dblog;
        ["", "beep"] call dblog;
*/

_message = [_this, 0, ""] call bis_fnc_param;
_attr = [_this, 1, ""] call bis_fnc_param;

switch (_attr) do {
  case "w": { "debug_console" callExtension (_message + "#1110") };
  case "wt": { "debug_console" callExtension (_message + "#1111") };
  case "r": { "debug_console" callExtension (_message + "#1000") };
  case "rt": { "debug_console" callExtension (_message + "#1001") };
  case "g": { "debug_console" callExtension (_message + "#0100") };
  case "gt": { "debug_console" callExtension (_message + "#0101") };
  case "b": { "debug_console" callExtension (_message + "#0010") };
  case "bt": { "debug_console" callExtension (_message + "#0011") };
  case "y": { "debug_console" callExtension (_message + "#1100") };
  case "yt": { "debug_console" callExtension (_message + "#1101") };
  case "p": { "debug_console" callExtension (_message + "#1010") };
  case "pt": { "debug_console" callExtension (_message + "#1011") };
  case "c": { "debug_console" callExtension (_message + "#0110") };
  case "ct": { "debug_console" callExtension (_message + "#0111") };
  case "f": { "debug_console" callExtension (_message + "~0000") };
  case "ft": { "debug_console" callExtension (_message + "~0001") };
  case "beep": { "debug_console" callExtension ("A") };
  case "clear": { "debug_console" callExtension ("C") };
  case "close": { "debug_console" callExtension ("X") };
  default {
    "debug_console" callExtension (_message);
  };
};
