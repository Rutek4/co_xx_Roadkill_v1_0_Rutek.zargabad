// private _state = _this # 0;

// if (didJIP) exitWith {
// 	enableEnvironment true;
// };

// switch (_state) do {
//     case "Start": {
//         titleCut ["","BLACK IN", 6000];
//         ["<t color='#ffffff' size = '1'>Ładowanie...</t>",-1,-1,30,1,0,789] spawn BIS_fnc_dynamicText;

// 		waitUntil {!isNull player && time > 30};
// 		playerReady = true;
// 		publicVariableServer "playerReady";

// 		waitUntil {allReady};
// 		openMap true;
// 		titleCut ["", "BLACK IN", 2];
//     };
//     case "End": {
//         enableEnvironment true;
// 		openMap false;
// 		titleCut ["", "BLACK IN", 2];
// 		"dynamicBlur" ppEffectEnable true;   
// 		"dynamicBlur" ppEffectAdjust [6];   
// 		"dynamicBlur" ppEffectCommit 0;     
// 		"dynamicBlur" ppEffectAdjust [0.0];  
// 		"dynamicBlur" ppEffectCommit 5;  
// 		[parseText format["<t font='PuristaBold' size='1.5'>%1</t>", 
// 		getMissionConfigValue ["OnLoadName", 0]], true, nil, 7, 0.7, 0] spawn BIS_fnc_textTiles; 

//     };
//     default {};
// };

hint "intro";