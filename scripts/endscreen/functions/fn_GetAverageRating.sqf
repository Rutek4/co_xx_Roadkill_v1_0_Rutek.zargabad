// params ['_id', '_rating'];

[clientOwner, "endRating"] remoteExec ["publicVariableClient", 2]; 

[{!isNil {endRating}}, {
    avgRating = 0;
	[endRating, {avgRating = avgRating + _value}] call CBA_fnc_hashEachPair;
	avgRating = avgRating / ([endRating] call CBA_fnc_hashSize);
	avgRating = [avgRating, 2] call BIS_fnc_cutDecimals;
}, nil, 5, {diag_log 'endRating error'}] call CBA_fnc_waitUntilAndExecute;