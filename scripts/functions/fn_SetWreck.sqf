/*
    Author: Rutek 2020

    Description:
    Spawns crew inside vehicle for the purpose of moving the turret.

    Parameter(s):
    0: OBJECT - Empty vehicle.
    
    Returns:
    None

    Example: [this, ['commanderViewHatch', 'driverViewHatch', 'HatchD', 'HatchCL', 'HatchC','HatchG']] call rtk_fnc_setWreck;
	configProperties [(configFile >> "CfgVehicles" >> "UK3CB_TKA_O_UAZ_Closed" >> "AnimationSources"), "isClass _x", true] apply {configName _x}
*/

params ['_veh', ['_doors', []], ['_isOnFire', true]];

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
}, _veh, 10] call CBA_fnc_waitAndExecute;

if (_isOnFire) then {
	[_veh, 'FireSound'] call rtk_fnc_CreateSFX;
	private _pos = getPos _veh;
	private _smoke = createAgent ['ModuleEffectsSmoke_F', [_pos # 0, _pos # 1, 55.5], [], 0, 'CAN_COLLIDE'];
	private _fire = createAgent ['ModuleEffectsFire_F', [_pos # 0, _pos # 1, 10.5], [], 0, 'CAN_COLLIDE'];
};

{
	if (round (random 1) > 0) then {
		_veh animatedoor [_x, 1];
	};
} forEach _doors;

_veh setDamage 0.8;