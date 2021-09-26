/*
    Author: Rutek 2021

    Description:
    Finds the terrain objects within given area.

    Parameter(s):
    0: ARRAY - In format [center, a, b, angle, isRectangle, height]: https://community.bistudio.com/wiki/BIS_fnc_getArea
    1: ARRAY - Type of terrain objects to hide (Possible type names: https://community.bistudio.com/wiki/nearestTerrainObjects)
    
    Returns:
    ARRAY - Found terrain objects.

    Example: 
    ['area_1', ["BUILDING", "HOUSE"]] call rtk_fnc_findTerrainObjects;
*/

params ['_area', ['_types', []]];

private _size = (_area # 1 max _area # 2) * 1.42;
private _found = nearestTerrainObjects [_area # 0, _types, _size, false, true]; 

_found