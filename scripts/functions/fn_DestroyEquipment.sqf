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

currentNadeMag_fnc = {
	params ['_caller'];
	_currentNadeArr = currentThrowable _caller;
	_currentNadeMag = "";
	if (count _currentNadeArr > 0) then {
		_currentNadeMag = _currentNadeArr select 0;
	};
	_currentNadeMag
};

currentNadeAmmo_fnc = {
	params ['_caller'];
	_currentNadeMag = [_caller] call currentNadeMag_fnc;
	_currentNadeAmmo = "";
	if (_currentNadeMag != "") then {
		_currentNadeAmmo = getText(configfile >> "CfgMagazines" >> _currentNadeMag >> "ammo");
	};
	_currentNadeAmmo
};

isFrag_fnc = {
	params ['_caller'];
	_currentNadeAmmo = [_caller] call currentNadeAmmo_fnc;
	_isFrag = false;
	if (_currentNadeAmmo != "") then {
		if (getNumber(configfile >> "CfgAmmo" >> _currentNadeAmmo >> "explosive") == 1) then {
			_isFrag = true;
		};
	};
	_isFrag
};

_mortar = _this select 0;

_id = [
	_mortar,    
	"Wrzuć granat",    
	"\rhsgref\addons\rhsgref_weapons\icons\f1_ca.paa",    
	"\a3\ui_f\data\IGUI\Cfg\actions\take_ca.paa",    
	"_this distance _target < 2 AND alive _target",    
	"_caller distance _target < 2 AND alive _target && [_caller] call isFrag_fnc",    
	{   
		if (!([_caller] call isFrag_fnc) && (local _caller)) then {
			hint "Wybierz granat odłamkowy";
		};   
	},
	{},
	{   
		[_target, _actionId] remoteExec ["BIS_fnc_holdActionRemove", 0]; 
		[_target, "throwInside"] call CBA_fnc_globalSay3d;
		_currentNadeMag = [_caller] call currentNadeMag_fnc;
		_currentNadeAmmo = [_caller] call currentNadeAmmo_fnc;
		sleep 1;
		_granade = _currentNadeAmmo createVehicle (position _target);  
		_granade hideObjectGlobal true;
		_caller removeMagazineGlobal _currentNadeMag;
		_equipment = getUnitLoadout player;
		sleep 1;
		player setUnitLoadout _equipment;
		sleep 4;
		_target setdamage 1;
	},
	{    
	},
	[],    
	1,    
	nil,    
	false,    
	false    
] call BIS_fnc_holdActionAdd; 