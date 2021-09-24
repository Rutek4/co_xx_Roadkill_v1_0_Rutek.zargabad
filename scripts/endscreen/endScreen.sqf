createDialog "ENDSCREEN";
_endScreenDialog = 400;
_endDisplay = (findDisplay _endScreenDialog);
_titleDialog = 1100;
_missionNameDialog = 1101;
_missionTextDialog = 1102;
_outcomeDialog = 1103;
_tasksDialog = 1104;
_leftTextDialog = 1105;
_rightTextDialog = 1106;
_exitTextDialog = 1107;
_timerDialog = 1108;
_ratingDialog = 1109;
_star_1 = 1200;
_star_2 = 1201;
_star_3 = 1202;
_star_4 = 1203;
_star_5 = 1204;

params ["_teamsMap"];

_tasksOutput = "";
_teamPlayersName = "";
_teamAiName = "";
_outcomeText = "TOTALNE ZWYCIĘSTWO";
_titleText = "AFTER ACTION REPORT";
_missionName = format ["%1", getMissionConfigValue ["OnLoadName", 0]];
_missionText = format ["%1", getMissionConfigValue ["overviewText", 0]];

// 0 totalne zwyciestwo
// 1 umiarkowane zwyciestwo
// 2 starcie nierozstrzygnięte (???)
// 3 porażka
// 4 totalna porażka

_allTasks = player call BIS_fnc_tasksUnit;

// if ((_allTasks select (count (_allTasks) - 1)) call BIS_fnc_taskState == 'FAILED') then {
// 	_outcomeText = "TOTALNA PORAŻKA";
// };

// {
// 	private ['_taskIcon','_taskEntry','_taskDesc'];

// 	if (_x call BIS_fnc_taskParent == "" && _outcomeText != "TOTALNA PORAŻKA") then {
// 		if (_x call BIS_fnc_taskState == 'FAILED') then {
// 			_outcomeText = "PORAŻKA";
// 		} else {
// 			{
// 				if (_x call BIS_fnc_taskState == 'FAILED') exitWith {
// 					_outcomeText = "UMIARKOWANE ZWYCIĘSTWO";
// 				};
// 				// if (_x call BIS_fnc_taskState == 'FAILED') then {
// 				// 	_outcomeText = "UMIARKOWANE ZWYCIĘSTWO";
// 				// };
// 			} forEach (_x call BIS_fnc_taskChildren);
// 		};
// 	};

// 	switch (_x call BIS_fnc_taskState) do {
//     	case 'SUCCEEDED': {
//     		_taskIcon = "<img color='#FFFFFF' size ='0.75' image='images\icons\win_icon.paa'/>  ";
//     	};
//     	case 'FAILED': {
//     		_taskIcon = "<img color='#FFFFFF' size ='0.75' image='images\icons\fail_icon.paa'/>  "
//     	};
// 	};
// 	_taskDesc = ((_x call BIS_fnc_taskDescription) select 0) select 0;
// 	_taskEntry = _taskIcon + _taskDesc + '<br/>';
// 	_tasksOutput = _tasksOutput + _taskEntry;
// } forEach _allTasks;

// _textSide = 0;
// _leftText = "";
// _rightText = "";

// {
// 	_x params ["_name", "_side", "_start", "_current", "_disabled", "_destroyed"];

// 	_teamTitle = "";
// 	switch (_side) do { 
// 		case WEST: { 
// 			_teamTitle = format ["<t font='PuristaBold' shadow='1' shadowColor='#0000FF' size='1' color='#FFFFFF'> %1</t><br/>", _name];
// 		}; 
// 		case EAST: { 
// 			_teamTitle = format ["<t font='PuristaBold' shadow='1' shadowColor='#FF0000' size='1' color='#FFFFFF'> %1</t><br/>", _name];
// 		}; 
// 		case INDEPENDENT: {
// 			_teamTitle = format ["<t font='PuristaBold' shadow='1' shadowColor='#008000' size='1' color='#FFFFFF'> %1</t><br/>", _name];
// 		};
// 	};

// 	_sideText = format["Straty w ludziach: %1<br/>", (_start - _current)];
// 	if (count _disabled != 0) then {
// 		_sideText = _sideText + "Sprzęt wyłączony z walki:<br/>";
// 		{
// 			_sideText = _sideText + format["%1<br/>", _x];
// 		} forEach _disabled;
// 	};
// 	if (count _destroyed != 0) then {
// 		_sideText = _sideText + "Sprzęt zniszczony:<br/>";
// 		{
// 			_sideText = _sideText + format["%1<br/>", _x];
// 		} forEach _destroyed;
// 	};

// 	if (_textSide == 0) then {
// 		_textSide = 1;
// 		_teamText = "<img size='0.9' image='images\icons\playersFlag.jpg'/>" + _teamTitle;
// 		_leftText = _teamText + _sideText;
// 	} else {
// 		_textSide = 0;
// 		_teamText = "<img size='0.9' image='images\icons\aiFlag.jpg'/>" + _teamTitle;
// 		_rightText = _teamText + _sideText;
// 	};

// } forEach _teams;

// titleCut ["","BLACK OUT", 5];
// sleep 6;
// titleCut ["","BLACK IN", 6];

// _blurred = ppEffectCreate ["DynamicBlur", 500]; 
// _blurred ppeffectenable true; 
// _blurred ppeffectadjust [3]; 
// _blurred ppeffectcommit 1;

// if ((date # 3 >= 6) && (date # 3 <= 19)) then {
// 	"colorCorrections" ppEffectAdjust [0.5, 0.5, 0, [1, 1, 1, 0], [1, 1, 1, 0], [0.75, 0.25, 0, 1.0]];
// } else {
// 	"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0], [1, 1, 1, 0], [0.75, 0.25, 0, 1.0]]; 
// };
// "colorCorrections" ppEffectCommit 1;  
// "colorCorrections" ppEffectEnable true;

// _endScreenCam = "camera" camCreate [0,0,0];
// _endScreenCam cameraEffect ["INTERNAL", "FRONT"]; 
// _endScreenCam camPrepareTarget (getPos endCam); 
// _endScreenCam camPreparePos (endCam modelToWorld [random [-100,0,100], random [-200,0,200], random [10,50,100]]); 
// _endScreenCam camCommitPrepared  0; 
// //_endScreenCam cameraEffect ["TERMINATE", "FRONT"];

// sleep 3;

// esc = compile preprocessFile "scripts\endscreen\escbind.sqf";
// ((findDisplay 46) displaySetEventHandler ["KeyDown","_this call esc"]);

// (_endDisplay displayCtrl _titleDialog) ctrlSetStructuredText parseText _titleText;
// (_endDisplay displayCtrl _missionNameDialog) ctrlSetStructuredText parseText _missionName;
// (_endDisplay displayCtrl _missionTextDialog) ctrlSetStructuredText parseText _missionText;
// (_endDisplay displayCtrl _outcomeDialog) ctrlSetStructuredText parseText _outcomeText;
// (_endDisplay displayCtrl _tasksDialog) ctrlSetStructuredText parseText _tasksOutput;
// (_endDisplay displayCtrl _leftTextDialog) ctrlSetStructuredText parseText _leftText;
// (_endDisplay displayCtrl _rightTextDialog) ctrlSetStructuredText parseText _rightText;

{
	ctrlSetText [_x, "images\icons\star_empty.paa"];
} forEach [_star_1, _star_2, _star_3, _star_4, _star_5];

(_endDisplay displayCtrl _star_1) ctrlAddEventHandler ["MouseButtonClick",{
	{
		((findDisplay 400) displayCtrl _x) ctrlSetEventHandler ["MouseExit", 
		"{ctrlSetText [_x, ""images\icons\star_filled.paa""];} forEach [1200]; 
		{ctrlSetText [_x, ""images\icons\star_empty.paa""];} forEach [1201,1202,1203,1204];"];
	} forEach [1200,1201,1202,1203,1204];
	[(clientOwner), 1] remoteExecCall ["RTK_fnc_UpdateRating", 2];
}];

(_endDisplay displayCtrl _star_2) ctrlAddEventHandler ["MouseButtonClick",{
	{ 
		((findDisplay 400) displayCtrl _x) ctrlSetEventHandler ["MouseExit", 
		"{ctrlSetText [_x, ""images\icons\star_filled.paa""];} forEach [1200,1201]; 
		{ctrlSetText [_x, ""images\icons\star_empty.paa""];} forEach [1202,1203,1204];"];
	} forEach [1200,1201,1202,1203,1204];
	[(clientOwner), 2] remoteExecCall ["RTK_fnc_UpdateRating", 2];
}];

(_endDisplay displayCtrl _star_3) ctrlAddEventHandler ["MouseButtonClick",{
	{
		((findDisplay 400) displayCtrl _x) ctrlSetEventHandler ["MouseExit", 
		"{ctrlSetText [_x, ""images\icons\star_filled.paa""];} forEach [1200,1201,1202]; 
		{ctrlSetText [_x, ""images\icons\star_empty.paa""];} forEach [1203,1204];"];
	} forEach [1200,1201,1202,1203,1204];
	[(clientOwner), 3] remoteExecCall ["RTK_fnc_UpdateRating", 2];
}];

(_endDisplay displayCtrl _star_4) ctrlAddEventHandler ["MouseButtonClick",{
	{
		((findDisplay 400) displayCtrl _x) ctrlSetEventHandler ["MouseExit", 
		"{ctrlSetText [_x, ""images\icons\star_filled.paa""];} forEach [1200,1201,1202,1203]; 
		{ctrlSetText [_x, ""images\icons\star_empty.paa""];} forEach [1204];"];
	} forEach [1200,1201,1202,1203,1204];
	[(clientOwner), 4] remoteExecCall ["RTK_fnc_UpdateRating", 2];
}];

(_endDisplay displayCtrl _star_5) ctrlAddEventHandler ["MouseButtonClick",{
	{
		((findDisplay 400) displayCtrl _x) ctrlSetEventHandler ["MouseExit", 
		"{ctrlSetText [_x, ""images\icons\star_filled.paa""];} forEach [1200,1201,1202,1203,1204];"];
	} forEach [1200,1201,1202,1203,1204];
	[(clientOwner), 5] remoteExecCall ["RTK_fnc_UpdateRating", 2];
}];

private _timer = 10;
while {_timer >= 0} do {
	(_endDisplay displayCtrl _timerDialog) ctrlSetStructuredText parseText (str _timer);
	_timer = _timer - 1;
	sleep 1;
};
(_endDisplay displayCtrl _timerDialog) ctrlSetStructuredText parseText "";

[] call RTK_fnc_GetAverageRating;

[{!isNil {avgRating}}, {
    ((_this # 0) displayCtrl (_this # 1)) ctrlSetStructuredText parseText format["%1/5", (str avgRating)];
}, [_endDisplay, _ratingDialog], 5, {
	((_this # 0) displayCtrl (_this # 1)) ctrlSetStructuredText parseText "Error";
	diag_log 'avgRating error';
}] call CBA_fnc_waitUntilAndExecute;

// sleep 5;

// closeDialog 1;
// _endScreenCam cameraEffect ["TERMINATE", "FRONT"];
// camDestroy _endScreenCam;
// endMission "Ending";