/**
                    * ExilelifeClient_object_player_thread_delirium
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_bloodAlcohol","_moveChance","_possibleMoves","_moveIndex"];
_bloodAlcohol = (ExileClientPlayerAttributes select 4);
if !(ExileClientDeliriumThread isEqualTo -1) then
{
	ExileClientPostProcessingDelirium ppEffectEnable true;
	_bloodAlcohol = (_bloodAlcohol - 0.1) max 0; 
	ExileClientPlayerAttributes set [4, _bloodAlcohol];
};
if (_bloodAlcohol isEqualTo 0) then
{
	ExileClientPostProcessingDelirium ppEffectEnable false;
	ExileClientPostProcessingDelirium ppEffectCommit 0; 
	[ExileClientDeliriumThread] call ExileClient_system_thread_removeTask;
	ExileClientDeliriumThread = -1;
	systemChat "You are now sober again.";
}
else 
{
	ExileClientPostProcessingDelirium ppEffectAdjust 
	[
		linearConversion [0, 3, _bloodAlcohol, 2, 		5, 		true],	
		linearConversion [0, 3, _bloodAlcohol, 0.1, 	0.2, 	true],	
		linearConversion [0, 3, _bloodAlcohol, 0.1, 	0.2, 	true],	
		linearConversion [0, 3, _bloodAlcohol, 0.2, 	1.5, 	true],	
		linearConversion [0, 3, _bloodAlcohol, 0.2, 	2, 		true],	
		linearConversion [0, 3, _bloodAlcohol, 2, 		4, 		true],	
		linearConversion [0, 3, _bloodAlcohol, 2, 		3, 		true],	
		linearConversion [0, 3, _bloodAlcohol, 0.01, 	0.02, 	true],	
		linearConversion [0, 3, _bloodAlcohol, 0.01, 	0.02, 	true],	
		linearConversion [0, 3, _bloodAlcohol, 0.01, 	0.01, 	true],	
		linearConversion [0, 3, _bloodAlcohol, 0.01, 	0.02, 	true],	
		linearConversion [0, 3, _bloodAlcohol, 0.01, 	0.05, 	true],	
		linearConversion [0, 3, _bloodAlcohol, 0.1,		0.25, 	true],	
		linearConversion [0, 3, _bloodAlcohol, 2, 		10, 	true],
		linearConversion [0, 3, _bloodAlcohol, 2, 		5, 		true]
	];
	ExileClientPostProcessingDelirium ppEffectCommit 0; 
	addCamShake 
	[
		linearConversion [0, 3, _bloodAlcohol, 0, 30, true], 
		15.9, 
		linearConversion [0, 3, _bloodAlcohol, 0.1, 0.3, true] 
	];
	if (_bloodAlcohol > 2) then
	{
		_moveChance = floor (random 100); 
		if (_moveChance <= 10) then
		{
			_possibleMoves = ["PlayerWalkB", "PlayerWalkF", "PlayerWalkL", "PlayerWalkLB", "PlayerWalkLF", "PlayerWalkR", "PlayerWalkRB", "PlayerWalkRF"];
			_moveIndex = floor (random (count _possibleMoves));
			player playActionNow (_possibleMoves select _moveIndex);
		};
	};
};
