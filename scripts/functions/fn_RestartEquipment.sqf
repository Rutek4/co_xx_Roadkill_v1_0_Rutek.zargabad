/*
    Author: Rutek 2020

    Description:
    Restore player's equipment.
    If used it will log the player name to the rpt file.

    Parameter(s):
    0: ARRAY - The player's loadout by getUnitLoadout command.
	1: BOOL - The boolean indicated if the EQ has been already copied.
    
    Returns:
    None

    Example: [equipment, isCopied] call rtk_fnc_restartEquipment
*/

params ['_equipment', '_isCopied'];

if (_isCopied) then {
	_text = "<t size='1.0' font='TahomaB'>Musisz poczekac 15 minut od ostatniego uzycia.</t>";
	hintSilent parseText _text;
	diag_log format ['Attempted try to copy equipment by %1', (name player)];
} else {
	player setUnitLoadout _equipment;
	_text = "<t size='1.0' font='TahomaB'>Skopiowano ekwipunek</t>";
	hintSilent parseText _text;
	_isCopied = true;
	isCopied = _isCopied;
	diag_log format ['Copied equipment by %1', (name player)];
};