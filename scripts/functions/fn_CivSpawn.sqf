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

params ['_obj', ['_className', 'UK3CB_TKC_C_CIV']];

private _civ = createAgent [_className, position _obj, [], 0, 'NONE'];
_civ call rtk_fnc_civConvert;

_civ