/*
  Author:
    Dmitry Loac

  Description:
    Init outpost timer.
    It's time need to win outpost side.

  Global variables:
    outpostTimer
    outpostTimerRemaining
*/

private [
    "_startTime"
];

// Save time of start mission without freeze time.
_startTime = time;

waitUntil {
    sleep 1;

    outpostTimerRemaining = outpostTimer + _startTime - time;

    outpostTimerRemaining < 0;
};