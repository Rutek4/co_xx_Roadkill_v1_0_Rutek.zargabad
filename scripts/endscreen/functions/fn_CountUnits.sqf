params ["_side", ["_isPlayerTeam", false]];
private ['_count'];

if (_isPlayerTeam) then {
	_count = _side countSide playableUnits;
} else {
	_count = ({alive _x && side _x == _side} count allUnits);
};

_count