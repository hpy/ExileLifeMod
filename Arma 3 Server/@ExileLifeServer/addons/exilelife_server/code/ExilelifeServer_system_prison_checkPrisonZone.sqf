/**
                    * ExilelifeServer_system_prison_checkPrisonZone
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

                    private["_prisonerID","_sessionID","_prisoner"];
if !(count ExileLifePrisonArray == 0) then
{
	{
		_prisonerID = _x;
		_sessionID = _prisonerID call ExileLifeServer_system_session_getIDfromPID;
		_prisoner = _sessionID call ExileServer_system_session_getPlayerObject;
		try
		{ 
			if(_sessionID=="") then 
			{
				throw true;
			};
			if(isNull _prisoner) then 
			{
				_prisonerID spawn ExileLifeServer_system_prison_prisonerEscape; 
				throw true;
			};			
			if !(_prisoner call ExileLifeClient_util_world_isInPrison) then
			{
				_prisonerID spawn ExileLifeServer_system_prison_prisonerEscape; 
				throw true;
			};
		}
		catch
		{
			if(_exception) then 
			{
				ExileLifePrisonArray deleteAt _forEachIndex;
			};
		};	
	} 
	forEach ExileLifePrisonArray;
};
