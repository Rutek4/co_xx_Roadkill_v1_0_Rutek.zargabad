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

_civ enableAI 'PATH';
_civ enableAI 'MOVE';
_civ disableAi 'TARGET';
_civ disableAi 'AUTOTARGET';
_civ disableAi 'AUTOCOMBAT';
_civ disableAi 'COVER';
_civ setSpeedMode 'FULL';

if (isNil {_veh}) then {
	[_civ] spawn {
		params ['_civ'];
	    private _pos = [_civ] call rtk_fnc_findNearestHouse;

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
	private _group = group _civ;

	// Run the function recursively for every group member if vehicle is not alive or it's locked or the end destination is not provided
	if (!alive _veh || locked _veh == 2 || isNil {_end}) exitWith {
		private _units = units (group _civ);
		{
			[_x] join grpNull;
			_x call rtk_fnc_civFlee; 
		} forEach _units;
	};

	// Order AI and his fellow group members to enter the vehicle
	_group addVehicle _veh;
	(units _group) orderGetIn true;
	_veh setVariable ["civFlee_end", _end]; 
	// Event Handler runs the traffic function once every alive group member is in the vehicle
	_veh addEventHandler ["GetIn", {
		params ["_vehicle", "_role", "_unit", "_turret"];

		_crew = units (group _unit);
		{
			_x assignAsCargo _veh;
		} forEach (_crew select {_x != _civ});

		if ({_x in _vehicle} count _crew == {alive _x} count _crew) then {
			private _end = _vehicle getVariable "civFlee_end";
			[_vehicle, nil, nil, _end] call rtk_fnc_civTraffic;
			_vehicle removeAllEventHandlers 'GetIn';
		};
	}];
};