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

params ['_pos', ['_className', 'UK3CB_TKC_C_CIV']];

private _area = _pos call BIS_fnc_getArea;
private _allBuildings = [_area, ['BUILDING', 'HOUSE']] call rtk_fnc_findTerrainObjects;
private _houses = [];
private _civs = [];

for '_k' from 0 to (count _allBuildings) do {
	if ([_allBuildings # _k] call BIS_fnc_isBuildingEnterable) then {
		_houses pushBack (_allBuildings # _k);
	};
};

{
	private _house = _x;
	{
		if (round (random 1) > 0) then {
			private _civ = createAgent [_className, _x, [], 0, 'CAN_COLLIDE'];
			_civ disableAI 'FSM';
			_civ disableAi 'TARGET';
			_civ disableAi 'AUTOTARGET';
			_civ disableAi 'AUTOCOMBAT';
			_civ disableAi 'COVER';
			_civ setBehaviour 'CARELESS';
			_civ setSpeedMode 'FULL';

			_civ addEventHandler ['FiredNear', {
				params ['_unit'];

				_unit playMoveNow 'ApanPknlMstpSnonWnonDnon_G01';
				_unit removeAllEventHandlers "FiredNear";
			}];

			_civs pushBack _civ;
		};
	// Select only positions on ground level (prevention against spawning on the roof)
	} forEach ((_house buildingPos -1) select {(_x # 2) < 1})
} forEach _houses;

_civs