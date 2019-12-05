/**
                    * ExilelifeServer_system_jobs_process_network_checkJobs
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

                    private["_sessionID","_playerObject","_currentJobs"];
_sessionID = _this select 0;
try
{
    _playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
    if (isNull _playerObject) then
    {
        throw "Player is Null";
    };
    _currentJobs = _playerObject getVariable ["ExileLifeJobs:Current",[]];
    if (count _currentJobs > 0) then
    {
        throw "Job in Progress";
    };
    [_sessionID,"overrideJobTask",[1]] call ExileServer_system_network_send_to;
}
catch
{
    format["exilelifeserver_system_jobs_process_network_checkJobs: %1",_exception] call ExileLifeServer_util_log;
};
