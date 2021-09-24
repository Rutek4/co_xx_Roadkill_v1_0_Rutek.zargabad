/*
    Author: Rutek 2020

    Description:
    Forces AI to surrender and put down his weapon.

    Parameter(s):
    0: OBJECT - The AI to surrender.
    
    Returns:
    None

    Example: this call rtk_fnc_unitSurrender;
*/

params ['_unit'];

if (!alive _unit) exitWith { false };
private _weapon = currentWeapon _unit;
private _unitPos = getPosATL _unit;
private _weaponPos = createVehicle ["Weapon_Empty", [(_unitPos # 0 + 0.25), (_unitPos # 1 + 0.25), (_unitPos # 2)], [], 0, "CAN_COLLIDE"];
_unit action ["PutWeapon", _weaponPos, _weapon];

[{ currentWeapon (_this # 0) == "" }, 
	{ [(_this # 0), true] call ACE_captives_fnc_setSurrendered;}, [_unit] 
] call CBA_fnc_waitUntilAndExecute;