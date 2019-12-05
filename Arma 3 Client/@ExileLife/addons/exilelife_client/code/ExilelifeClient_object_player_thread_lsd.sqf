/**
                    * ExilelifeClient_object_player_thread_lsd
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_lsdAmount","_moveChance","_possibleMoves","_moveIndex"];
ExileClientPostProcessingInversion ppEffectEnable false;
ExileClientPostProcessingGrain ppEffectEnable false;
ExileClientPostProcessingBlur ppEffectEnable false;
ExileClientPostProcessingColor ppEffectEnable false;
_lsdAmount = (ExileClientPlayerAttributes select ATTRIBUTE_LSD);
if !(ExileLifeClientLSDThread isEqualTo -1) then
{
	ExileClientPostProcessingDelirium ppEffectEnable true;
	ExileLifeClientPostProcessingInversion ppEffectEnable false;
	ExileLifeClientPostProcessingGrain ppEffectEnable false;
	ExileLifeClientPostProcessingBlur ppEffectEnable false;
	ExileLifeClientPostProcessingColor ppEffectEnable false;
	_lsdAmount = (_lsdAmount - 0.1) max 0; 
	ExileClientPlayerAttributes set [ATTRIBUTE_LSD, _lsdAmount];
};
if (_lsdAmount isEqualTo 0) then
{
	ExileClientPostProcessingDelirium ppEffectEnable false;
	ExileClientPostProcessingDelirium ppEffectCommit 0; 
	ExileLifeClientPostProcessingInversion ppEffectEnable false;
	ExileLifeClientPostProcessingInversion ppEffectCommit 4; 
	ExileLifeClientPostProcessingGrain ppEffectEnable false;
	ExileLifeClientPostProcessingGrain ppEffectCommit 4; 
	ExileLifeClientPostProcessingBlur ppEffectEnable false;
	ExileLifeClientPostProcessingBlur ppEffectCommit 4; 
	ExileLifeClientPostProcessingColor ppEffectEnable false;
	ExileLifeClientPostProcessingColor ppEffectCommit 4; 
	[ExileLifeClientLSDThread] call ExileClient_system_thread_removeTask;
	ExileLifeClientLSDThread = -1;
	systemChat "You are now sober again.";
}
else 
{
	ExileClientPostProcessingDelirium ppEffectAdjust 
	[
		linearConversion [0, 3, _lsdAmount, 2, 		5, 		true],	
		linearConversion [0, 3, _lsdAmount, 0.1, 	0.2, 	true],	
		linearConversion [0, 3, _lsdAmount, 0.1, 	0.2, 	true],	
		linearConversion [0, 3, _lsdAmount, 0.2, 	1.5, 	true],	
		linearConversion [0, 3, _lsdAmount, 0.2, 	2, 		true],	
		linearConversion [0, 3, _lsdAmount, 2, 		4, 		true],	
		linearConversion [0, 3, _lsdAmount, 2, 		3, 		true],	
		linearConversion [0, 3, _lsdAmount, 0.01, 	0.02, 	true],	
		linearConversion [0, 3, _lsdAmount, 0.01, 	0.02, 	true],	
		linearConversion [0, 3, _lsdAmount, 0.01, 	0.01, 	true],	
		linearConversion [0, 3, _lsdAmount, 0.01, 	0.02, 	true],	
		linearConversion [0, 3, _lsdAmount, 0.01, 	0.05, 	true],	
		linearConversion [0, 3, _lsdAmount, 0.1,		0.25, 	true],	
		linearConversion [0, 3, _lsdAmount, 2, 		10, 	true],
		linearConversion [0, 3, _lsdAmount, 2, 		5, 		true]
	];
	ExileClientPostProcessingDelirium ppEffectCommit 0; 
	addCamShake 
	[
		linearConversion [0, 3, _lsdAmount, 0, 30, true], 
		15.9, 
		linearConversion [0, 3, _lsdAmount, 0.1, 0.3, true] 
	];
	if (_lsdAmount > 2) then
	{
		_moveChance = floor (random 100); 
		if (_moveChance <= 30) then
		{
			_possibleMoves = ["PlayerWalkB", "PlayerWalkF", "PlayerWalkL", "PlayerWalkLB", "PlayerWalkLF", "PlayerWalkR", "PlayerWalkRB", "PlayerWalkRF"];
			_moveIndex = floor (random (count _possibleMoves));
			player playActionNow (_possibleMoves select _moveIndex);
		};
	};
};
