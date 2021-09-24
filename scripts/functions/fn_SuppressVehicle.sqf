/*
    Author: Rutek 2021

    Description:
    Forces AI's vehicle to shoot it's weapon above enemies in specified area.
    It won't work on single units.

    Parameter(s):
    0: OBJECT - The AI's vehicle to provide suppressing fire.
    1: Could be one of:
        OBJECT - trigger
        STRING - marker
        - The area for the AI to look for targets.
    2: STRING (optional) - Muzzle for AI's vehicle to use.
    3: STRING (optional) - Type of ammunition for AI's vehicle to use.
    
    Returns:
    None

    Example: 
    [lav_1, thisTrigger] call rtk_fnc_suppressVehicle;
    [lav_1, thisTrigger, 'HE', 'rhs_mag_230Rnd_25mm_M242_HEI'] call rtk_fnc_suppressVehicle;
*/

params ['_veh', '_area', ['_muzzle', ''], ['_ammo', '']];

if (_muzzle == '') then {
	_muzzle = currentMuzzle (gunner _veh);
};

if (_ammo == '') then {
	_ammo = _veh currentMagazineTurret [0];
};
	
_veh loadMagazine [[0], _muzzle, _ammo];

_veh addeventhandler ["fired", {(_this select 0) setvehicleammo 1}];

_veh setVariable ["RTK_isSuppressing", true];
// _veh setBehaviour "COMBAT";

// private _target = "Land_WoodenBox_02_F" createVehicleLocal [0,0,0];
private _target = "CBA_O_InvisibleTarget" createVehicleLocal [0,0,0];
_target allowdamage false;
_veh reveal [_target, 4];

[_veh, _area, _muzzle, _target] spawn {
    params ['_veh', '_area', '_muzzle', '_target'];

    // hint 'suppress start';
    while {alive _veh && alive (gunner _veh) && canFire _veh && _veh getVariable "RTK_isSuppressing"} do {
        private _enemies = (allUnits inAreaArray _area) select {(alive _x || lifeState _x != "Incapacitated") && side _x in (_veh call BIS_fnc_enemySides)}; //playableunits in area?
        if (lifeState (gunner _veh) == "Incapacitated" || count _enemies == 0) exitWith { 
        	// hint "no targets";
    	};

        // hint 'suppressING';
        private _randomTarget = selectRandom _enemies;
        private _randomPos = [[[getPosATL _randomTarget, 5]],[]] call BIS_fnc_randomPos;
        _target setposATL [_randomPos # 0, _randomPos # 1, 2 + random 2];
        _veh doWatch _target;
		_veh doTarget _target;
        sleep 0.5;

        private _burst = 0;
        while {_burst < 5 + random 20} do {
            _veh fireAtTarget [_target, _muzzle];
            sleep 0.1;
            _burst = _burst + 1;
        };
        sleep 0.5;
    };

    // hint 'suppress end';
    deleteVehicle _target;
    _veh setVariable ["RTK_isSuppressing", false];
    _veh doWatch objNull;
	// _veh removeEventHandler ["Reloaded", 0];
};


// configfile >> "CfgVehicles" >> "rhs_bmp2_msv" >> "Turrets" >> "MainTurret"
// currentMuzzle (gunner (vehicle player));

//HE
//"rhs_weap_pkt"


//AP
//"rhs_weap_pkt"
