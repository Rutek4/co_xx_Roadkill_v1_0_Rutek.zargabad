/*
    Author: Rutek 2020

    Description:
    Forces AI to shoot it's personal weapon above enemies in specified area.
    AI will leave his actual group.
    It won't work on vehicles.

    Parameter(s):
    0: OBJECT - The AI providing suppressing fire.
    1: Could be one of:
        OBJECT - trigger
        STRING - marker
        - The area for the AI to look for targets.
    
    Returns:
    None

    Example: [gunner_1, thisTrigger] call rtk_fnc_suppress;
*/

params ["_unit", "_area"];

if (!alive _unit) exitWith {};

_unit setVariable ["isSuppressing", true];
_unit setBehaviour "COMBAT";

_unit addEventHandler ["Reloaded", {
    private _mag = _this # 4 # 0;
    private _unit = _this # 0;
    _unit addMagazine _mag;
}];

private _fireMode = currentWeaponMode _unit;
private _weaponModes = (getArray (configFile >> "CfgWeapons" >> (currentWeapon _unit) >> "modes"));
_fireMode = switch (true) do {
    case ("FullAuto" in _weaponModes): {
        "FullAuto"
    };
    case ("close" in _weaponModes): {
        "close"
    };
    case ("medium" in _weaponModes): {
        "medium"
    };
    default {
        currentWeaponMode _unit
    };
};

private _target = "Land_WoodenBox_02_F" createVehicleLocal [0,0,0];
// private _target = "CBA_O_InvisibleTarget" createVehicleLocal [0,0,0];
_target allowdamage false;
_unit reveal [_target, 4];

[_unit, _fireMode, _area, _target] spawn {
    params ["_unit", "_fireMode", "_area", "_target"];

    while {alive _unit && _unit getVariable "isSuppressing"} do {
        private _enemies = (allUnits inAreaArray _area) select {(alive _x || lifeState _x != "Incapacitated") && side _x in (_unit call BIS_fnc_enemySides)};
        if (lifeState _unit == "Incapacitated" || count _enemies == 0) exitWith {};

        private _randomTarget = selectRandom _enemies;
        private _randomPos = [[[getPosATL _randomTarget, 5]],[]] call BIS_fnc_randomPos;
        _target setposATL [_randomPos # 0, _randomPos # 1, 2 + random 1];
        _unit doWatch _target;
		_unit doTarget _target;

        sleep 0.5;

        if (getSuppression _unit < 0.1) then {
            private _burst = 0;
            while {_burst < 5 + random 50} do {
                _unit forceWeaponFire [currentWeapon _unit, _fireMode];
                sleep 0.1;
                _burst = _burst + 1;
            };
            sleep 0.5;
            [_unit] join grpnull; 
        };
    };

    deleteVehicle _target;
    _unit setVariable ["isSuppressing", false];
    _unit doWatch objNull;
	_unit removeEventHandler ["Reloaded", 0];
};