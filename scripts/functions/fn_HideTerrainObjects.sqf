/*
    Author: Rutek 2021

    Description:
    It works the same way as Hide Terrain Objects module, but here you can choose the type of objects to hide.

    Parameter(s):
    0: Could be one of:
    	OBJECT - trigger
		STRING - marker
		ARRAY - array in format [center, distance] or [center, [a, b, angle, rect, (height)]] or [center, a, b, angle, rect, (height)]
		LOCATION - location
    1: ARRAY - Type of terrain objects to hide (Possible type names: https://community.bistudio.com/wiki/nearestTerrainObjects)
    
    Returns:
    None

    Example: ['marker_1', ['TREE', 'SMALL TREE']] call rtk_fnc_hideTerrainObjects;
*/

params ['_pos', ['_types', []]];

_area = _pos call BIS_fnc_getArea;
_size = (_area # 1 max _area # 2) * 1.42;
_found = nearestTerrainObjects [_area # 0, _types, _size, false, true]; 
{ _x hideobjectglobal true } forEach (_found inAreaArray _area);