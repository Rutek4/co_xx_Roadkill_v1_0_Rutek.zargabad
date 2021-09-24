/*
    Author: Rutek 2021

    Description:
    Spawns random dog on specifid position and apply barking sound and animation.

    Parameter(s):
    0: OBJECT - Position for dog to spawn.
    
    Returns:
    OBJECT - dog

    Example: this call rtk_fnc_spawnDog;
*/

params ['_pos'];
private ['_dog', '_bark'];

_dog = createAgent ["Fin_random_F", getPos _pos, [], 0, "CAN_COLLIDE"];
_dog setVariable ["BIS_fnc_animalBehaviour_disable", true];
_bark = createSoundSource ["barkingSound", position _dog, [], 0];
_bark attachTo [_dog];

_dog addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	{
	  deleteVehicle _x;
	} forEach attachedObjects _unit;
	_unit removeAllEventHandlers 'Killed';
	_unit removeAllEventHandlers 'Deleted';
}];

_dog addEventHandler ["Deleted", {
	params ["_entity"];
	{
	  deleteVehicle _x;
	} forEach attachedObjects _entity;
	_entity removeAllEventHandlers 'Killed';
	_entity removeAllEventHandlers 'Deleted';
}];

[_dog] spawn {
	params ['_dog'];
	while {alive _dog} do {
		_dog playMoveNow "Dog_Idle_Bark";
		sleep 1.5;
	};
};

_dog