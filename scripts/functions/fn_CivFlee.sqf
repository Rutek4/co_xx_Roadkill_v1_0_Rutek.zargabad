/*
    Author: Rutek 2021

    Description:
    Forces AI to flee with applied animation. 
    AI will look for nearby house or enterable building in the closest city or a village.
    AI will use the specified vehicle if both optional parameters are provided.

    Parameter(s):
    0: OBJECT - Civilian AI that is to be fleeing.
    1: OBJECT (optional) - Vehicle to be used by fleeing AI.
    2: OBJECT (optional) - Final destination for fleeing vehicle.
    
    Returns:
    None

    Example: 
    [this] call rtk_fnc_civFlee;
    [this, car_1, target] call rtk_fnc_civFlee;
*/

params ['_civ', '_veh', '_end'];
private ['_loc', '_group'];

_civ enableAI 'PATH';
_civ enableAI 'MOVE';
_civ disableAi 'TARGET';
_civ disableAi 'AUTOTARGET';
_civ disableAi 'AUTOCOMBAT';
_civ disableAi 'COVER';
_civ setSpeedMode 'FULL';

// Find the closest position of named city or a village to the AI
_loc = locationPosition (nearestLocations [getPos _civ, ['NameVillage', 'NameCity', 'NameCityCapital'], worldSize, _civ] # 0);

if (isNil {_veh}) then {

	[_civ, _loc] spawn {
	    params ['_civ', '_loc'];
	    private ['_houses', '_radius', '_i', '_pos', '_house', '_allBuildings'];

	    _allBuildings = [];
		_houses = [];
		_radius = 150;
		_i = 0;
		while {(count _houses) < 5 && _i <= 20} do {

			if (_i <= 10) then {
				// Search for closest surrounding buildings for the first 10 iterations
				_allBuildings = (getPos _civ) nearObjects ['House', _radius * _i];
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
			sleep 0.1;
		};
		// Select random building position index if any enterable building has been found
		_pos = _loc;
		if ((count _houses) > 1) then {
			_house = selectRandom _houses;
			_pos = selectRandom (_house buildingPos -1);
		};

		while {alive _civ} do {
			// Delete AI if it's in the destination position and no player found within 300m range from the AI
			if (_civ inArea [_pos, 5, 5, 0, false] && {_x distance _civ < 300} count allPlayers == 0) then {
				deleteVehicle _civ;
			};
			// Force AI to stop if there is any player within 10m from the AI
			if ({_x distance _civ < 10} count allPlayers > 0) then {
				doStop _civ;
				_civ playMoveNow 'ApanPknlMstpSnonWnonDnon_G01';
			} else {
				// Resume the doMove if there is no player close to AI and AI is not moving
	    		if ((speed _civ) == 0) then {
	    			_civ playMoveNow 'ApanPknlMstpSnonWnonDnon_G01';
		    		_civ doMove _pos;
	    		};
			};

			sleep 5;
		};
	};

} else {
	if (!alive _veh || locked _veh == 2) then {
		// Run the function recursively if vehicle is not alive or it's locked
		_civ call rtk_fnc_civFlee; 
	} else {
		// Order AI and his fellow group members to enter the vehicle
		_group = group _civ;
		_group addVehicle _veh;
		(units _group) orderGetIn true;
		_veh setVariable ["civFlee_end", _end]; 
		// Event Handler runs the traffic function once every alive group member is in the vehicle
		_veh addEventHandler ["GetIn", {
			params ["_vehicle", "_role", "_unit", "_turret"];
			private ['_end'];

			_crew = units (group _unit);
			if ({_x in _vehicle} count _crew == {alive _x} count _crew) then {
				_end = _vehicle getVariable "civFlee_end";
				[_vehicle, nil, nil, _end] call rtk_fnc_civTraffic;
				_vehicle removeAllEventHandlers 'GetIn';
			};
		}];

	};
};