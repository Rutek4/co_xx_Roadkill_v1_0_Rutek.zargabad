/*
    Author: Rutek 2021

    Description:
	Spawns agents as civilians inside the enterable buildings on the given area.

    Parameter(s):
    0: Could be one of:
    	OBJECT - Trigger
		STRING - Marker
		ARRAY - Array in format [center, distance] or [center, [a, b, angle, rect, (height)]] or [center, a, b, angle, rect, (height)]
		LOCATION - Location
	1: STRING - Class name of the civilian to be spawned as agent.
	
    Returns:
	ARRAY - Spawned civilian agents.

    Example: 
    [this] call rtk_fnc_civSpawnArea;
*/

params ['_pos', ['_isRunning', false], ['_max', -1], ['_className', 'UK3CB_TKC_C_CIV']];

private _area = _pos call BIS_fnc_getArea;
private _allBuildings = [_area, ['BUILDING', 'HOUSE']] call rtk_fnc_findTerrainObjects;
private _houses = [];
private _civs = [];

for '_k' from 0 to (count _allBuildings) do {
	if ([_allBuildings # _k] call BIS_fnc_isBuildingEnterable) then {
		_houses pushBack (_allBuildings # _k);
	};
};

civRun_rtk_fnc = {
	params ['_civ', '_houses'];

	if (!alive _civ) exitWith {};

	[{
		private _civ = _this # 0;
		private _house = selectRandom (_this # 1);
		private _pos = selectRandom (_house buildingPos -1);

		if (round (random 4) > 2) then {
			_civ switchMove "";
		} else {
			_civ playMoveNow 'ApanPknlMstpSnonWnonDnon_G01';
		};

		if (round (random 3) > 2) then {
			_civ setSpeedMode 'NORMAL';
		};

		_civ moveTo _pos;
		_this call civRun_rtk_fnc;
	}, [_civ, _houses], random (round 120)] call CBA_fnc_waitAndExecute;
};

addCivEventHandler_rtk_fnc = {
	params ['_civ'];

	if (!alive _civ) exitWith {
		_civ removeAllEventHandlers "FiredNear";
	};

	_civ addEventHandler ['FiredNear', {
		params ["_unit", "_firer", "_distance"];

		if (_distance < 5) then {
			[{
				private _unit = _this;
				_unit say3D (selectRandom ['cry1', 'cry2', 'cry3']);
				private _pos = _unit call rtk_fnc_findNearestBuildingPos;
				_unit moveTo _pos;
				_unit removeAllEventHandlers "FiredNear";

				[{(_this # 0) distance (_this # 1) < 3}, {
					(_this # 0) call addCivEventHandler_rtk_fnc;
				}, [_unit, _pos], 60, {
					(_this # 0) call addCivEventHandler_rtk_fnc;
				}] call CBA_fnc_waitUntilAndExecute;

			}, _unit, round (random 3)] call CBA_fnc_waitAndExecute;
		};
	}];
};

{
	private _house = _x;
	{
		if (_max != -1 && count _civs >= _max) exitWith {};

		if (round (random 3) > 2) then {
			private _civ = createAgent [_className, _x, [], 0, 'CAN_COLLIDE'];
			_civ disableAI 'FSM';
			_civ disableAI 'TARGET';
			_civ disableAI 'AUTOTARGET';
			_civ disableAI 'AUTOCOMBAT';
			_civ disableAI 'COVER';
			_civ setBehaviour 'CARELESS';
			_civ setSpeedMode 'FULL';

			[{ _this playMoveNow 'ApanPknlMstpSnonWnonDnon_G01'; }, _civ, round (random 5)] call CBA_fnc_waitAndExecute;
			
			if (_isRunning) then {
				[_civ, _houses] call civRun_rtk_fnc;
			} else {
				_civ call addCivEventHandler_rtk_fnc;
			};

			_civs pushBack _civ;
		};
	// Select only positions on ground level (prevention against spawning on the roof)
	} forEach ((_house buildingPos -1) select {(_x # 2) < 1})
} forEach _houses;

_civs