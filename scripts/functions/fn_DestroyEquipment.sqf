/*
    Author: Rutek 2021

    Description:
    Adds the hold action on the specifiec object which allows to throw grenade inside the object to destroy it.

    Parameter(s):
    0: OBJECT - Object to be allowed for the destruction.
    1: STRING - Class Name of the grenade which can destroy the object.
    
    Returns:
    NUMBER - Action ID

    Example: 
    [this, 'rhs_mag_an_m14_th3'] call rtk_fnc_destroyEquipment;
*/

params ['_obj', '_className'];

_obj setVariable ['destroyGrenade', _className]; 

getGrenadeMag_rtk_fnc = {
	params ['_caller'];
	private _arr = currentThrowable _caller;
	private _mag = '';
	if (count _arr > 0) then {
		_mag = _arr # 0;
	};
	_mag
};

getGrenadeAmmo_rtk_fnc = {
	params ['_caller'];
	private _mag = [_caller] call getGrenadeMag_rtk_fnc;
	private _ammo = '';
	if (_mag != '') then {
		_ammo = getText(configfile >> 'CfgMagazines' >> _mag >> 'ammo');
	};
	_ammo
};

geisCorrectGrenade_rtk_fnc = {
	params ['_target', '_caller'];
	private _grenade = _target getVariable 'destroyGrenade';
	private _mag = [_caller] call getGrenadeMag_rtk_fnc;
	private _isCorrect = false;
	if (_mag == _grenade) then {
		_isCorrect = true;
	};
	_isCorrect
};

private _id = [
	_obj,    
	'Wrzuć granat',    
	getText(configfile >> 'CfgMagazines' >> _className >> 'picture'),    
	'\a3\ui_f\data\IGUI\Cfg\actions\take_ca.paa',    
	'_this distance _target < 3 AND alive _target',    
	'_caller distance _target < 3 AND alive _target && [_target, _caller] call geisCorrectGrenade_rtk_fnc',    
	{   
		if (!([_target, _caller] call geisCorrectGrenade_rtk_fnc) && (local _caller)) then {
			hint 'Wybierz odpowedni granat';
		};   
	},
	{},
	{   
		[_target, _actionId] remoteExec ['BIS_fnc_holdActionRemove', 0]; 
		_target say3D 'throwInside';
		private _mag = [_caller] call getGrenadeMag_rtk_fnc;
		private _ammo = [_caller] call getGrenadeAmmo_rtk_fnc;
		sleep 1;
		private _granade = _ammo createVehicle (position _target);  
		_granade hideObjectGlobal true;
		_caller removeMagazineGlobal _mag;
		private _equipment = getUnitLoadout player;
		sleep 1;
		player setUnitLoadout _equipment;
		sleep 5;
		_target setdamage 0.8;
	},
	{    
	},
	[],    
	1,    
	nil,    
	false,    
	false    
] call BIS_fnc_holdActionAdd; 

_id