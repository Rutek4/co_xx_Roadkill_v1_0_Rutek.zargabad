/*
    Author: Rutek 2021

    Description:
    Simulate the AI's one way traffic.
   	AI will slow down and eventually stop the vehicle if there is any player nearby or other occupied vehicle is in front.
   	Fleeing AI function will be applied to every crew member once he gets out the vehicle.
	Not to be used with AI's two way traffic.
	There are 2 ways to use this function:
	1: Provide the existing vehicle and final destination
	2: Provide the classname, spawn point and final destination.

    Parameter(s):
    0: OBJECT (optional) - Existing vehicle with AI on board.
    1: OBJECT (optional) - Vehicle's classname to be spawned.
    2: OBJECT (optional) - Spawn point for vehicle.
    3: OBJECT - Final destination for fleeing vehicle.
    
    Returns:
    None

    Example: 
    [car_1, nil, nil, target] call rtk_fnc_civTraffic;
    [nil, 'UK3CB_TKC_C_Datsun_Civ_Closed', start, end] call rtk_fnc_civTraffic;
*/

params ['_veh', '_class', '_start', '_end'];
private ['_dir', '_vehCont', '_group', '_wp'];
// Spawn new vehicle or use the provided one
if (isNil {_veh}) then {
	_dir = [_start, _end] call BIS_fnc_dirTo;

	_vehCont = [(getpos _start), _dir, _class, civilian] call BIS_fnc_spawnVehicle;
	_veh = _vehCont # 0;
	_group = _vehCont # 2;
} else {
	_group = group (driver _veh);
};

_veh disableAi 'TARGET';
_veh disableAi 'AUTOTARGET';
_veh disableAi 'AUTOCOMBAT';
_veh disableAi 'COVER';
_veh setCaptive true;
_veh forceFollowRoad true;
_veh allowCrewInImmobile true;
_group allowFleeing 0;

_wp = _group addWaypoint [_end, 0];

_wp setWaypointType 'MOVE';
_wp setWaypointBehaviour 'SAFE';
_wp setWaypointCombatMode 'BLUE';
_wp setWaypointSpeed 'NORMAL';
// Delete AI's vehicle and group once AI is in the final destination
_wp setWaypointStatements [
	'true',
	'private _group = group this; 
	if (local _group) then {
		private _veh = vehicle this; 
		{ _veh deleteVehicleCrew _x } forEach crew _veh; 
		deleteVehicle _veh;
		{ deleteVehicle _x } forEach units _group;
		deleteGroup _group;
	};
	_veh removeAllEventHandlers ''Killed'';
	_veh removeAllEventHandlers ''GetOut'';'
];
// Event Handler forces driver's group members to leave vehicle once he is killed
(driver _veh) addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	private ['_vehicle', '_group'];

	_vehicle = objectParent _unit;
	_group = group _unit;
	deleteWaypoint [_group, 0];
	doGetOut (units _group);
	_group leaveVehicle _vehicle;
	{
		unassignVehicle _x; 
	} forEach units _group;
	_unit removeAllEventHandlers 'Killed';
}];
// Event Handler applies the civFlee function to every AI which left the vehicle
_veh addEventHandler ['GetOut', {
	params ['_vehicle', '_role', '_unit', '_turret'];

	[_unit] join grpNull; 
	_unit call rtk_fnc_civFlee;
	if ({alive _x} count (crew _vehicle) == 0) then {
		_vehicle removeAllEventHandlers 'GetOut';
	};
}];

[_veh] spawn {
    params ['_veh'];
    private ['_entities', '_isStop', '_blockade'];

    while {alive _veh && alive (driver _veh)} do {
    	// Gather all entities except vehicle itself within 50m range from the vehicle
    	_entities = ((ASLToAGL getPosASL _veh) nearEntities 50) select {_x != _veh};

    	_isStop = false;
    	_blockade = objNull;
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
			doStop _veh;
		} else {
			// Resume the standard move if the blockade is no longer found and vehicle is not moving
			if ((speed _veh) == 0) then {
				_veh forceSpeed -1;
	    		_veh doFollow (effectiveCommander _veh);
    		};
		};
    	sleep 0.5;
    };
};