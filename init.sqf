if (isServer) then {

	// {
	// 	[_x] call rtk_fnc_cacheGroup
	// } forEach (allGroups select {side (leader _x) != WEST})

	// readyCount = 0;
	// 'playerReady' addPublicVariableEventHandler {
	// 	readyCount = readyCount + 1;
	// 	if (readyCount == count (call BIS_fnc_listPlayers)) then {
	// 		'scripts\intro.sqf' remoteExec ['execVM', -1];
	// 	};
	// };

	ace_cookoff_enable = false;
	ace_cookoff_enableAmmoCookoff = false;
	ace_cookoff_ammoCookoffDuration = 0;
	setViewDistance 2500;
	
	// private _lamps = nearestObjects [(getMarkerPos 'AO_marker'), ['Lamps_base_F', 'PowerLines_base_F', 'PowerLines_Small_base_F'], 1000];
	// {
	// 	for '_i' from 0 to count getAllHitPointsDamage _x do
	// 	{
	// 		_x setHitIndex [_i, 0.97];
	// 	};
	// } forEach _lamps;

	{
		_x setSkill ['aimingAccuracy',(0.25 + (random 0.1))];
		_x setSkill ['aimingShake',(0.25 + (random 0.1))];
		_x setSkill ['spotDistance',0.35];
		_x setSkill ['spotTime',0.3];
		_x setSkill ['courage',(0.5 + (random 0.15))];
		_x setSkill ['commanding',0.25];
		_x setSkill ['aimingSpeed',0.15];
		_x setSkill ['general',0.15];
		_x setSkill ['endurance',0.25];
		_x setSkill ['reloadSpeed',(0.25 + (random 0.2))];
	} forEach allUnits; // easy

	teamPlayerMap = ['USMC', WEST, true] call rtk_fnc_addTeam;
	teamAiMap = ['Takistani Militia', EAST, false] call rtk_fnc_addTeam;

	isMissionEnd = false;

	[] spawn {
		while {true} do {
			[teamPlayerMap, 'currentCount', [[teamPlayerMap, 'side'] call CBA_fnc_hashGet, true] call rtk_fnc_countUnits] call CBA_fnc_hashSet;
			[teamAiMap, 'currentCount', [[teamAiMap, 'side'] call CBA_fnc_hashGet, false] call rtk_fnc_countUnits] call CBA_fnc_hashSet;

			if (isMissionEnd) exitWith {
				teamsMap = [[['teamPlayer', teamPlayerMap], ['teamAi', teamAiMap]], 0] call CBA_fnc_hashCreate; 
				[teamsMap] call rtk_fnc_endMissionEvent;
			};

			uisleep (15);
		};
	};
};

if (!isDedicated) then {

	CHVD_allowNoGrass = true; // Set 'false' if you want to disable 'Low' option for terrain (default: true)
	CHVD_maxView = 2500; // Set maximum view distance (default: 12000)
	CHVD_maxObj = 2500;  // Set maximimum object view distance (default: 12000)  
	setViewDistance 2500;

	// enableEnvironment false;
	enableEngineArtillery false;
	enableRadio false;
	0 fadeRadio 0; 
	enableSaving [false, false];
	// enableSentences false;
	player playAction 'PlayerCrouch';
	player addRating 1000000;
	player setVariable ['BIS_noCoreConversations', true];
	[player, currentWeapon player, currentMuzzle player] call ace_safemode_fnc_lockSafety;

	'colorCorrections' ppEffectAdjust [1, 1, 0, [0.5, 0.5, 0.5, 0.0],[1.5, 1.5, 1.5, 0.7],[-0.03, 0.27, 0.3, -0.19]];
	'colorCorrections' ppEffectCommit 1; 
	'colorCorrections' ppEffectEnable true;

	[] execVM 'scripts\briefing.sqf';
	// [] execVM 'scripts\tabMySquad.sqf';
	// ['AO_marker'] execVM 'scripts\ao_marker.sqf';
	[lav_1, lav_2, lav_3, lav_4] execVM 'scripts\ai_drivers.sqf';
	
	['endScreen', {_this execVM 'scripts\endscreen\endScreen.sqf'}] call CBA_fnc_addEventHandler;

	[] spawn {
		while {alive player} do {
			equipment = getUnitLoadout player;
			isCopied = false;
			sleep 900;
		};
	};

	[] spawn {
		while {true} do {
			playSound 'firefight';
			sleep 41;
		};
	};

	// [] spawn {
	// 	while {alive s2} do {
	// 		s2 say3D (selectRandom ['radio1', 'radio2', 'radio3']);
	// 		sleep 15 + random 60;
	// 	};
	// };

	// waitUntil { missionnamespace getvariable ['BIS_fnc_startLoadingScreen_ids', []] isEqualTo [] };
	// publicVariableServer 'playerReady';
};