/*
    Author: Rutek 2020

    Description:
    Sets alpha for all map markers except user defined and AO markers.

    Parameter(s):
    0: NUMBER - Sets alpha between 0..1.
    
    Returns:
    None

    Example: 1 call rtk_fnc_setMarkersAlpha;
*/

params["_alpha"];

{ 
	if (!(["USER_DEFINED",  _x] call BIS_fnc_inString) && !(["ao_",  _x] call BIS_fnc_inString)) then {
		_x setMarkerAlphaLocal _alpha;
    }; 
} foreach allMapMarkers;