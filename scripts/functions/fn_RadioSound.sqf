/*
    Author: Rutek 2020

    Description:
    It plays the sound and show the subtitles.

    Parameter(s):
    0: STRING - Sound name.
    1: STRING - Callsign to be shown.
    2: STRING - Subtitles to be shown.
    
    Returns:
    None

    Example: ['sound_1', 'ALPHA', 'ALPHA zgłaszam.'] call rtk_fnc_radioSound;
*/

params ['_sound', '_callsign', '_text'];

playSound _sound;
[_callsign, _text] spawn BIS_fnc_showSubtitle; 