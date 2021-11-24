/*
    Author: Rutek 2021

    Description:
    Adds SFX sound to the given object.

    Parameter(s):
    0: OBJECT - Position for dog to spawn.
    
    Returns:
    OBJECT - dog

    Example: this call rtk_fnc_spawnDog;
*/

params ['_obj', '_sound', ['_isDestructible', true]];

private _sfx = createSoundSource [_sound, position _obj, [], 0];
_sfx attachTo [_obj];

if (_isDestructible) then {
	_obj addEventHandler ["Hit", {
		params ["_unit"];
		{
		deleteVehicle _x;
		} forEach attachedObjects _unit;
		_unit removeAllEventHandlers 'Hit';
		_unit removeAllEventHandlers 'Deleted';
	}];
};

_obj addEventHandler ["Deleted", {
	params ["_entity"];
	{
	  deleteVehicle _x;
	} forEach attachedObjects _entity;
	_entity removeAllEventHandlers 'Hit';
	_entity removeAllEventHandlers 'Deleted';
}];

_sfx