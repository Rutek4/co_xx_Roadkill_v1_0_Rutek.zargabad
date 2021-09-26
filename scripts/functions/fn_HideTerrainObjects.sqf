/*
    Author: Rutek 2021

    Description:
    Hides the terrain objects within given area.
    It works the same way as Hide Terrain Objects module, but here you can choose the type of objects to hide.

    Parameter(s):
    0: Could be one of:
      OBJECT - Trigger
      STRING - Marker
      ARRAY - Array in format [center, distance] or [center, [a, b, angle, rect, (height)]] or [center, a, b, angle, rect, (height)]
      LOCATION - Location
    1: ARRAY - Type of terrain objects to hide (Possible type names: https://community.bistudio.com/wiki/nearestTerrainObjects)
    
    Returns:
    None

    Example: ['marker_1', ['TREE', 'SMALL TREE']] call rtk_fnc_hideTerrainObjects;
*/

params ['_pos', ['_types', []]];

private _area = _pos call BIS_fnc_getArea;
private _found = [_area, _types] call rtk_fnc_findTerrainObjects;
{ _x hideobjectglobal true } forEach (_found inAreaArray _area);