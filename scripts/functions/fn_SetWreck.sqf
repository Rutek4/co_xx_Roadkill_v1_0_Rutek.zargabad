/*
    Author: Rutek 2020

    Description:
    Spawns crew inside vehicle for the purpose of moving the turret.

    Parameter(s):
    0: OBJECT - Empty vehicle.
    
    Returns:
    None

    Example: this call rtk_fnc_setWreck;
*/

params ['_veh'];

_veh setCaptive true;
_veh allowCrewInImmobile true;
_veh lock true;
_veh setFuel 0;
createVehicleCrew _veh;
{
	_x disableAI "TARGET";
	_x disableAI "AUTOTARGET";  
	_x disableAI "AUTOCOMBAT"; 
	_x disableAI "MOVE"; 
	_x disableAI "FSM"; 
	_x setcaptive true;
} forEach (crew _veh);
private _target = "CBA_O_InvisibleTarget" createVehicleLocal [0,0,0];
_target attachTo [_veh, [[-5, 5] call BIS_fnc_randomInt, 10, 0 + random 2]]; 
_veh doWatch _target;
[{
	{
		unassignVehicle _x; 
		deleteVehicle _x;
	} forEach (crew _this);
}, _veh, 8] call CBA_fnc_waitAndExecute;