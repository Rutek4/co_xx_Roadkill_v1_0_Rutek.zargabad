/*
    Author: Rutek 2020

    Description:
    Unhides and enables AI from specific group.
    If any group member is in the vehicle it will unhide it as well.

    Parameter(s):
    0: GROUP - The group to be uncached.
    
    Returns:
    None

    Example: [group this] call rtk_fnc_groupUnCache;
*/

params ['_group'];

{
    _x enablesimulationglobal true;
    _x hideobjectglobal false;
    _x enableAI "TARGET";
    _x enableAI "AUTOTARGET";
    _x enableAI "MOVE";
    _x enableAI "ANIM";
    _x enableAI "FSM";

    private _veh = objectParent _x;
    if (!isNull _veh) then {
    	_veh enablesimulationglobal true;
    	_veh hideobjectglobal false;
    };
} forEach (units _group);