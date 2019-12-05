/**
                    * ExilelifeServer_system_prisonRecords_network_getPrisonerFinesRequest
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

                    private["_sessionID","_parameter","_player","_dbPID","_fineHistory"];
_sessionID = _this select 0;
_parameter = _this select 1;
try
{
	_player = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _player) then
	{
		throw "Player Object is null";
	};
	if (!alive _player) then
    {
        throw "Player is dead!";
    };
	_dbPID = _player getVariable ["ExileLifePID",-1];
	if (_player getVariable ["ExileMutex",false]) then
	{
		throw "Spamming for Prisoner Records";
	};
	if (_player getVariable ["ExileMutex",false]) then
	{
		throw "Spamming for Prisoner Records";
	};
	_fineHistory = format ["getPrisonerFines:%1",_dbPID] call ExileServer_system_database_query_selectFull;
	if(typename _fineHistory != "ARRAY") then{
		throw "Error Processing getPrisonerFines DB Request!";
	};
	_player setVariable ["ExileMutex",false];
	[_sessionID, "getPrisonerFinesResponse", [["test"]]] call ExileServer_system_network_send_to;
}
catch
{
	_player setVariable ["ExileMutex",false];
	[_sessionID, "getPrisonerFinesResponse", []] call ExileServer_system_network_send_to;
	_exception call ExileLifeServer_util_debugLog;
};
