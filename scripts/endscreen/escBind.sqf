switch (_this select 1) do
{
	//ESC
	case 1: 
	{
		hint "end";
		endMission "Koniec";
		(findDisplay 46) displayRemoveAllEventHandlers "KeyDown";
	};
};