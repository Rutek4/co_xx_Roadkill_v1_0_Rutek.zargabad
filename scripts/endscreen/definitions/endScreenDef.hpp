class ENDSCREEN
{
	idd = 400;
	movingEnable = false;
	enableSimulation = true;
	controls[] = {
		TITLE, 
		MISSION_NAME, 
		MISSION_OVERVIEWTEXT, 
		OUTCOME,TASKS, 
		LEFT_TEXT, 
		RIGHT_TEXT, 
		EXIT_TEXT, 
		TIMER, 
		RATING, 
		STAR_1, 
		STAR_2, 
		STAR_3, 
		STAR_4, 
		STAR_5};

	class TITLE: RscStructuredText_title
	{
		idc = 1100;
		x = 0.386577 * safezoneW + safezoneX;
		y = 0.148089 * safezoneH + safezoneY;
		w = 0.226846 * safezoneW;
		h = 0.0439888 * safezoneH;
		size = "0.03 * safezoneH";
	};
	class MISSION_NAME: RscStructuredText_missionName
	{
		idc = 1101;
		x = 0.386577 * safezoneW + safezoneX;
		y = 0.203075 * safezoneH + safezoneY;
		w = 0.226846 * safezoneW;
		h = 0.0439888 * safezoneH;
		size = "0.03 * safezoneH";
	};
	class MISSION_OVERVIEWTEXT: RscStructuredText_missionOverviewText
	{
		idc = 1102;
		x = 0.345333 * safezoneW + safezoneX;
		y = 0.247064 * safezoneH + safezoneY;
		w = 0.309335 * safezoneW;
		h = 0.0659832 * safezoneH;
		size = "0.03 * safezoneH";
	};
	class OUTCOME: RscStructuredText_outcome
	{
		idc = 1103;
		x = 0.345333 * safezoneW + safezoneX;
		y = 0.313047 * safezoneH + safezoneY;
		w = 0.309335 * safezoneW;
		h = 0.0439888 * safezoneH;
		size = "0.03 * safezoneH";
	};
	class TASKS: RscStructuredText
	{
		idc = 1104;
		x = 0.345333 * safezoneW + safezoneX;
		y = 0.357036 * safezoneH + safezoneY;
		w = 0.309335 * safezoneW;
		h = 0.131966 * safezoneH;
		size = "0.03 * safezoneH";
	};
	class LEFT_TEXT: RscStructuredText
	{
		idc = 1105;
		x = 0.345333 * safezoneW + safezoneX;
		y = 0.488997 * safezoneH + safezoneY;
		w = 0.123734 * safezoneW;
		h = 0.286072 * safezoneH;
		size = "0.03 * safezoneH";
	};
	class RIGHT_TEXT: RscStructuredText
	{
		idc = 1106;
		x = 0.530933 * safezoneW + safezoneX;
		y = 0.488997 * safezoneH + safezoneY;
		w = 0.123734 * safezoneW;
		h = 0.286072 * safezoneH;
		size = "0.03 * safezoneH";
	};
	class EXIT_TEXT: RscStructuredText
	{
		idc = 1107;
		x = 0.345333 * safezoneW + safezoneX;
		y = 0.818919 * safezoneH + safezoneY;
		w = 0.309335 * safezoneW;
		h = 0.0439888 * safezoneH;
		size = "0.03 * safezoneH";
	};
	class TIMER: RscStructuredText_missionName
	{
		idc = 1108;
		x = 0.89698 * safezoneW + safezoneX;
		y = 0.147911 * safezoneH + safezoneY;
		w = 0.0670225 * safezoneW;
		h = 0.0770194 * safezoneH;
		size = "0.03 * safezoneH";
	};
	class RATING: RscStructuredText_missionName
	{
		idc = 1109;
		x = 0.469067 * safezoneW + safezoneX;
		y = 0.742061 * safezoneH + safezoneY;
		w = 0.061867 * safezoneW;
		h = 0.0550139 * safezoneH;
		size = "0.03 * safezoneH";
	};
	class STAR_1: RscActiveText
	{
		idc = 1200;
		x = 0.448444 * safezoneW + safezoneX;
		y = 0.797075 * safezoneH + safezoneY;
		w = 0.0206223 * safezoneW;
		h = 0.0440111 * safezoneH;
		size = "0.03 * safezoneH";
		onMouseEnter = "(_this select 0) ctrlSetText ""images\icons\star_filled.paa""; {ctrlSetText [_x, ""images\icons\star_empty.paa""];} forEach [1201,1202,1203,1204];";
		onMouseExit = "(_this select 0) ctrlSetText ""images\icons\star_empty.paa"";";
	};
	class STAR_2: RscActiveText
	{
		idc = 1201;
		x = 0.469067 * safezoneW + safezoneX;
		y = 0.797075 * safezoneH + safezoneY;
		w = 0.0206223 * safezoneW;
		h = 0.0440111 * safezoneH;
		size = "0.03 * safezoneH";
		onMouseEnter = "{ctrlSetText [_x, ""images\icons\star_filled.paa""];} forEach [1200,1201]; {ctrlSetText [_x, ""images\icons\star_empty.paa""];} forEach [1202,1203,1204];";
		onMouseExit = "{ctrlSetText [_x, ""images\icons\star_empty.paa""];} forEach [1200,1201];";
	};
	class STAR_3: RscActiveText
	{
		idc = 1202;
		x = 0.489689 * safezoneW + safezoneX;
		y = 0.797075 * safezoneH + safezoneY;
		w = 0.0206223 * safezoneW;
		h = 0.0440111 * safezoneH;
		size = "0.03 * safezoneH";
		onMouseEnter = "{ctrlSetText [_x, ""images\icons\star_filled.paa""];} forEach [1200,1201,1202]; {ctrlSetText [_x, ""images\icons\star_empty.paa""];} forEach [1203,1204];";
		onMouseExit = "{ctrlSetText [_x, ""images\icons\star_empty.paa""];} forEach [1200,1201,1202];";
	};
	class STAR_4: RscActiveText
	{
		idc = 1203;
		x = 0.510311 * safezoneW + safezoneX;
		y = 0.797075 * safezoneH + safezoneY;
		w = 0.0206223 * safezoneW;
		h = 0.0440111 * safezoneH;
		size = "0.03 * safezoneH";
		onMouseEnter = "{ctrlSetText [_x, ""images\icons\star_filled.paa""];} forEach [1200,1201,1202,1203]; {ctrlSetText [_x, ""images\icons\star_empty.paa""];} forEach [1204];";
		onMouseExit = "{ctrlSetText [_x, ""images\icons\star_empty.paa""];} forEach [1200,1201,1202,1203];";
	};
	class STAR_5: RscActiveText
	{
		idc = 1204;
		x = 0.530933 * safezoneW + safezoneX;
		y = 0.797075 * safezoneH + safezoneY;
		w = 0.0206223 * safezoneW;
		h = 0.0440111 * safezoneH;
		size = "0.03 * safezoneH";
		onMouseEnter = "{ctrlSetText [_x, ""images\icons\star_filled.paa""];} forEach [1200,1201,1202,1203,1204];";
		onMouseExit = "{ctrlSetText [_x, ""images\icons\star_empty.paa""];} forEach [1200,1201,1202,1203,1204];";
	};
};

