/*
    Author: Rutek 2021

    Description:
    Creates a flare in the air.

    Parameter(s):
    0: OBJECT - The center position, can be trigger or object.
    1: NUMBER - Radius specifying the area from the center.
    2: STRING - Type of flare.
    
    Returns:
    None

    Example: [thisTrigger, 'F_40mm_Yellow'] call rtk_fnc_flare;

    F_40mm_White
	F_40mm_Red
	F_40mm_Yellow
	F_40mm_Green
	Flare_82mm_AMOS_White
*/

params ['_target', '_radius', ['_type', 'F_40mm_White']];

private _randomPos = [((getPosATL _target) # 0) - _radius + (2 * random _radius), ((getPosATL _target) # 1) - _radius + (2 * random _radius), 50];
private _flare = createVehicle [_type, _randomPos, [], 0, "none"]; 
_flare setVelocity [wind select 0, wind select 1, 30];