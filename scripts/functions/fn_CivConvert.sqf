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

params ['_civ', '_type'];

_civ disableAI 'FSM';
_civ disableAi 'TARGET';
_civ disableAi 'AUTOTARGET';
_civ disableAi 'AUTOCOMBAT';
_civ disableAi 'COVER';
_civ setBehaviour 'CARELESS';
_civ setSpeedMode 'FULL';

_civ addEventHandler ['FiredNear', {
	params ['_unit', '_firer', '_distance'];

	if (_distance <= 20) then {
		_unit stop true;
		_unit playMoveNow 'ApanPpneMstpSnonWnonDnon_G01';	
		[{
			(_this # 0) stop false;
			(_this # 0) playMoveNow 'ApanPknlMstpSnonWnonDnon_G01';
		}, [_unit], round (random [10, 30, 15])] call CBA_fnc_waitAndExecute;	
	} else {
		_unit stop false;
		_unit playMoveNow 'ApanPknlMstpSnonWnonDnon_G01';
	}
}];