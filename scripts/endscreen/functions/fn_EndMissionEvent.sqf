params ["_teamsMap"];

isMissionEnd = true;

{
	_x enableSimulation false;
} forEach vehicles;

{
	[objNull, _x] call ace_medical_treatment_fnc_fullHeal;
	_x enableSimulation false;
	_x disableAI "ALL";
} forEach allUnits;

{
	private _teamMap = [_teamsMap, _x] call CBA_fnc_hashGet;
	private _side = [_teamMap, 'side'] call CBA_fnc_hashGet;
	private _damagedAssets = [_side] call rtk_fnc_getDamagedAssets;

	[_teamMap, 'disabled', _damagedAssets select 0] call CBA_fnc_hashSet;
	[_teamMap, 'destroyed', _damagedAssets # 1] call CBA_fnc_hashSet;
} forEach ([_teamsMap] call CBA_fnc_hashKeys);

endRating = [[], 0] call CBA_fnc_hashCreate; 
// endRating = [[
// ['A', 1],
// ['B', 2],
// ['C', 5],
// ['D', 4]
// ], 0] call CBA_fnc_hashCreate; 

["endScreen", [_teamsMap]] call CBA_fnc_globalEvent;
