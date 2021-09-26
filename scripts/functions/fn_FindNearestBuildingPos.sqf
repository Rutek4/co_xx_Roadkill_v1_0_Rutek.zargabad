/*
    Author: Rutek 2021

    Description:
	Finds random nearby position in enterable building in the closest city or a village.

    Parameter(s):
    0: OBJECT - Object
    
    Returns:
    ARRAY - A single building position in format PositionAGL (https://community.bistudio.com/wiki/buildingPos).

    Example: 
    [this] call rtk_fnc_findNearestBuildingPos;
*/

params ['_obj'];

// Find the closest position of named city or a village to the Object
private _loc = locationPosition (nearestLocations [getPos _obj, ['NameVillage', 'NameCity', 'NameCityCapital'], worldSize, _obj] # 0);
private _pos = objNull;
private _allBuildings = [];
private _houses = [];
private _radius = 150;
private _i = 0;

while {(count _houses) < 5 && _i <= 20} do {

	if (_i <= 10) then {
		// Search for closest surrounding buildings for the first 10 iterations
		_allBuildings = (getPos _obj) nearObjects ['House', _radius * _i];
	} else {
		// Search for buildings in closest city or a village for the rest 10 iterations
		_allBuildings = _loc nearObjects ['House', _radius * (_i - 10)];
	};
	// Check if any found building is enterable and then add it to the array
	for '_k' from 0 to (count _allBuildings) do {
		if ([_allBuildings # _k] call BIS_fnc_isBuildingEnterable) then {
			_houses pushBack (_allBuildings # _k);
		};
	};

	_i = _i + 1;
};
// Select random building position index if any enterable building has been found
_pos = _loc;
if ((count _houses) > 1) then {
	private _house = selectRandom _houses;
	_pos = selectRandom (_house buildingPos -1);
};

_pos