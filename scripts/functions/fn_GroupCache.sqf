/*
    Author: Rutek 2020

    Description:
    Hides and disable AI from specific group.
    If any group member is in the vehicle it will be hided as well.

    Parameter(s):
    0: GROUP - The group to be cached.
    
    Returns:
    None

    Example: [group this] call rtk_fnc_groupCache;
*/

params ['_group'];

{
    _x enablesimulationglobal false;
    _x hideobjectglobal true;
    _x disableAI "TARGET";
    _x disableAI "AUTOTARGET";
    _x disableAI "MOVE";
    _x disableAI "ANIM";
    _x disableAI "FSM";

    private _veh = objectParent _x;
    if (!isNull _veh) then {
    	_veh enablesimulationglobal false;
    	_veh hideobjectglobal true;
    };
} forEach (units _group);