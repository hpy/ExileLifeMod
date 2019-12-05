/**
                    * ExilelifeServer_system_jobs_scenes_prisonCollect_onCompletion
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

                    private["_sessionID","_playerObject","_jobClassname","_position","_result","_vehicleNetId","_vehicle","_bonus","_members","_pid","_recipientSessionID"];
_sessionID = _this select 0;
_playerObject = _this select 1;
_jobClassname = _this select 2;
_position = _this select 3;
_result = "";
try
{
    _playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
    if (isNull _playerObject) then
    {
        throw "Null player.";
    };
     if !(_playerObject getVariable ["ExileLifeClient:Guard",false]) then
    {
        throw "Invalid player.";
    };
    _vehicleNetId = _playerObject getVariable ["ExileLifeJobVehicle",""];
    _vehicle = objectFromNetId _vehicleNetId;
    if(isNull _vehicle) then {
        [_sessionID] call ExileLifeServer_system_jobs_process_network_failJobRequest;
        throw "Vehicle does not exist";
    };
    if !(alive _vehicle) then {
        [_sessionID] call ExileLifeServer_system_jobs_process_network_failJobRequest;
        throw "Vehicle is destroyed";
    };
    if (_playerObject distance _vehicle > 30) then {
        throw "Your vehicle is too far away!";
    };
    _bonus = _vehicle getVariable ["ExileLifeJobReward",-1];
    if(_bonus>0) then {
    	if (isNumber (configFile >> "CfgJobs" >> _jobClassname >> "RequiredMembers")) then {
    		_playerObject setVariable ["ExileLifeJobMultiJob","",true];
    		_members = (missionNamespace getVariable format["ExileLifeJobMembers:%1",_jobClassname]);
    		missionNamespace setVariable [format["ExileLifeJobMembers:%1",_jobClassname],nil];
    		if (typeName _members == "Array") then
    		{
    			{
    				_pid = _x;
    				_recipientSessionID = _pid call ExileLifeServer_system_session_getIDfromDBID;
    				if(_recipientSessionID!=_sessionID) then {
    					[_recipientSessionID] call ExileLifeServer_system_jobs_process_network_completeJobRequest;
    				};
    			}forEach _members;
    		};
    	};
    };
}
catch
{
    _result = _exception;
    [_sessionID,"toastRequest",["ErrorTitleAndText",["Error",_result]]] call ExileServer_system_network_send_to;
};
_result
