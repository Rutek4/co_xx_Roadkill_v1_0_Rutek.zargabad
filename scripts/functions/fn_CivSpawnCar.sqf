/*
    Author: Rutek 2021

    Description:
    Simulate the AI's one way traffic.
   	AI will slow down and eventually stop the vehicle if there is any player nearby or other occupied vehicle is in front.
   	Fleeing AI function will be applied to every crew member once he gets out the vehicle.
	Not to be used with AI's two way traffic.

    Parameter(s):
    1: OBJECT - Vehicle's classname to be spawned.
    2: OBJECT - Spawn point for vehicle.
    3: OBJECT - Final destination for fleeing vehicle.
    
    Returns:
	ARRAY - Vehicle crew.

    Example: 
    ['UK3CB_TKC_C_Ikarus', start, end] call rtk_fnc_civSpawnCar;
*/

params ['_vehClasses', '_start', '_end', ['_isLoop', false]];

if ({_start distance _x < 50} count vehicles > 0) exitWith {
	[{
		_this call rtk_fnc_civSpawnCar;
	}, [_vehClasses, _start, _end, _isLoop], 15] call CBA_fnc_waitAndExecute;
};

private _pos = getPos _start;
private _dir = [_start, _end] call BIS_fnc_dirTo;
private _crew = [];
private _vehClass = selectRandom _vehClasses;
private _seatsCount = getNumber (configFile >> "CfgVehicles" >> _vehClass >> "transportSoldier");
private _crewClass = [civilian, configFile >> "CfgVehicles" >> _vehClass] call BIS_fnc_selectCrew;

private _veh = _vehClass createVehicle _pos;
_veh setDir _dir;
private _driver = createAgent [_crewClass, _pos, [], 0, 'NONE'];
_driver moveInDriver _veh;
_crew pushBack _driver;

for '_k' from 0 to _seatsCount do {
	if (round (random 3) > 2) then {
		private _passenger = createAgent [_crewClass, _pos, [], 0, 'NONE'];
		_passenger moveInCargo [_veh, _seatsCount];
		_crew pushBack _passenger;
	};
};

{
	_x disableAI 'FSM';
	_x disableAi 'TARGET';
	_x disableAi 'AUTOTARGET';
	_x disableAi 'AUTOCOMBAT';
	_x disableAi 'COVER';
	_x setBehaviour 'SAFE';
	_x setSpeedMode 'FULL';

	if (isNull objectParent _x) then {
		deleteVehicle _x;
	}
} forEach _crew;

_veh setCaptive true;
_veh forceFollowRoad true;
_veh forceSpeed (_veh getSpeed 'FULL');

civDelete_rtk_fnc = {
	params ['_civ'];

	[{
		if ({_this distance _x < 300} count allPlayers > 0) then {
			_this call civDelete_rtk_fnc;
		} else {
			deleteVehicle _this;
		}
	}, _civ, 300] call CBA_fnc_waitAndExecute;
};

civFlee_rtk_fnc = {
	params ['_veh'];

	private _crew = crew _veh;
	{
		private _passenger = _x;
		[{
			_this enableAI "PATH";
			moveOut _this;
			_this playMoveNow 'ApanPknlMstpSnonWnonDnon_G01';
			private _pos = _this call rtk_fnc_findNearestBuildingPos;
			_this moveTo _pos;
			if (round (random 1) > 0) then {
				_this say3D (selectRandom ['cry1', 'cry2', 'cry3']);
			};
			_this call civDelete_rtk_fnc;
		}, _passenger, round (random 3)] call CBA_fnc_waitAndExecute;
	} forEach _crew;
};

_driver addEventHandler ["Killed", {
	params ["_unit"];

	private _vehicle = objectParent _unit;
	_vehicle call civFlee_rtk_fnc;
	_unit removeAllEventHandlers 'Killed';
}];

_veh addEventHandler ["Dammaged", {
	params ["_unit"];

	if (!canMove _unit) then {
		_unit call civFlee_rtk_fnc;
		(driver _unit) removeAllEventHandlers 'Killed';
		_unit removeAllEventHandlers 'Dammaged';
	};
}];

_veh moveTo (getPos _end);

null = [_veh, _vehClasses, _start, _end, _isLoop] spawn {
    params ['_veh', '_vehClasses', '_start', '_end', '_isLoop'];
	
	private _driver = (driver _veh);
    while {canMove _veh && alive _veh && alive _driver} do {
    	// Gather all entities except vehicle itself within 50m range from the vehicle
    	private _entities = ((ASLToAGL getPosASL _veh) nearEntities 50) select {_x != _veh};

    	private _blockade = objNull;
    	for '_i' from 0 to (count _entities) do {
			private _entity = _entities # _i;
			// Limit vehicle's speed if there is any player nearby or there is a occupied vehicle in front
			if (!isNil {_entity}) then {
				if ((isPlayer _entity) || 
					((_entity isKindOf 'LandVehicle') &&
					 [_veh, _entity, 0] call BIS_fnc_isInFrontOf &&
					  {alive _x} count (crew _entity) > 0)) exitWith {
						_blockade = _entity;
						_veh forceSpeed 10;
				};
			};

			sleep 0.1;
    	};
    	// Force AI to stop if there is any blockade found
    	if (!isNull _blockade && _veh distance2D _blockade < 25) then {
			_driver disableAI "PATH";
			if (round (random 3) > 2) then {
				// Horn
				_driver forceWeaponFire [currentweapon _veh, currentWeapon _veh];
			};
		} else {
			// Resume the standard move if the blockade is no longer found and vehicle is not moving
			if ((speed _veh) == 0) then {
				_driver enableAI "PATH";
    		};
			_veh forceSpeed (_veh getSpeed 'FULL');
		};
		// Delete vehicle and its crew on destination
		if (_veh distance2D _end < 20) then {
			{
				deleteVehicle _x;
			} forEach (crew _veh);
			deleteVehicle _veh;

			if (_isLoop) then {
				[{
					_this call rtk_fnc_civSpawnCar;
				}, [_vehClasses, _start, _end, _isLoop], 30] call CBA_fnc_waitAndExecute;
			}
		};
    	sleep 0.5;
    };
};

[_veh, _crew]