/**
                    * ExilelifeServer_system_jobs_scenes_general_gangRecruitment_onProgression_step2
                    *
                    * Exile Mod
                    * www.exilemod.com
                    * © 2016 Exile Mod Team
                    *
                    * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
                    * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
                    * 
                    * Permission granted to ExileLife Dev Team to overwrite files and redistribute them
                    *
                    */

                    private["_sessionID","_jobClassname","_nextStep","_gang","_result","_msg","_playerObject","_playerClass"];
_sessionID = _this select 0;
_jobClassname = _this select 1;
_nextStep = _this select 2;
_gang = _this select 3;
_result = "";
_msg = "";
try
{ 
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	_playerClass = _playerObject getVariable ['ExileLifeClientClass', ""];
	if (isNil "_playerClass") then 
	{
		throw "Somehow you got amnesia and are good for nothing but cannon fodder";
	};
	switch (toLower _playerClass) do 
	{ 
		case "thief" : 		{ 
								_msg = "The crate has a false bottom in it. Grab the weed and bring it to me!";
							};
		case "smuggler" : 	{ 
								_msg = "The crate has a false bottom in it. Grab the weed and bring it to me!";
							};
		case "murderer" : 	{ 
								_msg = "Nicely done! Make sure your not being followed then come and see me!";
							};
		case "thug" :		{ 
								_msg = "BOOM! Dont you just love blowing shit up? Now get out of there before they catch you and come see me!";
							};
		default {  throw "You somehow got amnesia and forgot everything about anything"; }; 
	};
	[_sessionID,"completeSideQuest",[_msg]] call ExileServer_system_network_send_to;
}
catch
{
	_result = _exception;
};
_result