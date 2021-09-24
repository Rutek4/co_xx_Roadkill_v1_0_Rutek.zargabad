/*
    Author: Rutek 2021

    Description:
    Enables or disables AI features within AI group.

    Parameter(s):
    0: GROUP - The group to be disabled/enabled.
    
    Returns:
    None

    Example: [group this] call rtk_fnc_groupFeatures;
*/

params ['_group', '_sections', '_isEnabled'];

{
	{
	  _x enableAIFeature _isEnabled;
	} forEach _sections;
} forEach (units _group);