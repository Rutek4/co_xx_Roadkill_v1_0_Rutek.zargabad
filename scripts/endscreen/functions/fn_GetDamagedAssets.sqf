params ['_side'];
private _disabledVehicles = [];
private _destroyedVehicles = [];

{
	_veh = _x;
	_vehName = _veh getVariable "vehName";
	if (!isNil {_vehName}) then {
		_vehTeam = _veh getVariable "vehTeam";
		if (_vehTeam == str _side) then {
			if (alive _veh) then {
				if (!canMove _veh && !canFire _veh) then {
					_disabledVehicles pushBack _vehName;
				};
			} else {
				_destroyedVehicles pushBack _vehName;
			};
		};
	};
} forEach vehicles;

_disabledVehicles = [_disabledVehicles] call rtk_fnc_stackNames;
_destroyedVehicles = [_destroyedVehicles] call rtk_fnc_stackNames;

[_disabledVehicles, _destroyedVehicles]

// (vehicle this) setVariable ["vehName", "GAZ-233011"]; 
// (vehicle this) setVariable ["vehTeam", "EAST"]; 