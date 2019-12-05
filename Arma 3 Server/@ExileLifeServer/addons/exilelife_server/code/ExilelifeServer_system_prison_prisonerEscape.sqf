/**
                    * ExilelifeServer_system_prison_prisonerEscape
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

                    private["_prisonerID","_sessionID","_prisoner","_msg","_dbPID","_infractionID","_prisonerSessionID"];
_prisonerID = _this;
_sessionID = _prisonerID call ExileLifeServer_system_session_getIDfromPID;
_prisoner = _sessionID call ExileServer_system_session_getPlayerObject;
try
{
	if (isNull _prisoner) then
	{
		throw true;
	};
	if !(alive _prisoner) then
	{
		throw false;
	};
	throw true;
}
catch
{
	if(_exception) then
	{
		_name = [_prisoner] call ExileLifeClient_util_player_name;
		_msg = format["Prisoner %1 has broken out of the labor mine!",_name];
		["Guard", "baguetteRequest", [["PRISON BREAK",_msg]]] call ExileLifeServer_system_network_send_to_gang;
		_dbPID = _prisoner getVariable ["ExileLifePID",-1];
		[_dbPID,"SYSTEM",1,-1] call ExileLifeServer_system_prisonRecords_updateCriminalRecord;
		_infractionID = format["createPrisonerInfraction:%1:%2:%3:%4:%5:%6",_dbPID,"SYSTEM","Escaped Labor Mines",[],0,0] call ExileServer_system_database_query_insertSingle;
		if(count (_prisoner getVariable ["ExileLifeJobs:Current",[]]) > 0) then
		{
			[_prisonerSessionID,[netid _prisoner,1]] call ExileLifeServer_system_jobs_process_network_overrideJobRequest;
		};
		_prisoner setVariable ["ExileLifePrisoner",false,true];
		_prisoner call ExileServer_object_player_database_update;
	};
};
