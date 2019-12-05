/**
                    * ExilelifeServer_admintools_util_activityLog
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

                    private["_sessionID","_message","_playerObject","_playerUID","_log"];
params [["_sessionID",""],["_message",""]];
_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
_playerUID = getPlayerUID _playerObject;
if !(_message isEqualTo "") then
{
    _log = format ["Admin %1 (%2) %3",name _playerObject,_playerUID, _message];
	[_log,"AT_Activity"] call ExileLifeServer_util_A3Log;
	ExileLifeLogs_Server_AdminActivity pushBack _log;
};
