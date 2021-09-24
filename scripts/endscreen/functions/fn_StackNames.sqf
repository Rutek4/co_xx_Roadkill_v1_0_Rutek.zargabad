params ['_array'];
private _unique = [];

{
	_current = _x;
	_unique pushBackUnique format ["%1 X %2", {_x == _current} count _array, _current];
} forEach _array;

_unique