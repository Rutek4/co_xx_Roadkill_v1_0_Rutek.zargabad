params ["_name", "_side", ["_isPlayerTeam", false]];
private ['_map'];

_map = [[
	['name', _name], 
	['side', _side], 
	['startCount', [_side, _isPlayerTeam] call rtk_fnc_countUnits]
], 0] call CBA_fnc_hashCreate; 

_map