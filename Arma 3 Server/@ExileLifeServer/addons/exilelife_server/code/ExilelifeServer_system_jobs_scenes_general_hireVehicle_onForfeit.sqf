/**
                    * ExilelifeServer_system_jobs_scenes_general_hireVehicle_onForfeit
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

                    private["_sessionID","_playerObject","_result","_vehicleNetID","_vehicle","_playerPos","_locationName","_criminalRecord","_armed","_dbPID","_crimeDesc","_itemsArray","_cashAmount","_infractionID"];
_sessionID = _this select 0;
_playerObject = _this select 1;
_result = "";
_vehicleNetID = _playerObject getVariable ["ExileLifeJobVehicle",""];
if(_vehicleNetID != "") then
{
    _vehicle = objectFromNetId _vehicleNetID;
    _vehicle setVariable ["ExileLifePermittedDrivers",[],true];
    _playerObject setVariable ["ExileLifeJobVehicle","",true];
    _playerPos = getposATL _playerObject;
    _name = [_playerObject, "FULL"] call ExileLifeServer_util_player_getName;
    _locationName = [_playerPos] call ExileClient_util_world_getNearestLocationName;
    if (_locationName isEqualTo "") then
    {
    	_locationName = _playerPos;
    };
    ["Guard", "toastRequest", ["ErrorTitleAndText", ["Vehicle Theft!", (format ['Convict: %1 <br/> Last seen near %2!',_name,_locationName])]]] call ExileLifeServer_system_network_send_to_gang;
    ExileLifeWantedVehicles = ExileLifeWantedVehicles + [_vehicle,_playerObject];
    _criminalRecord = _playerObject getVariable ["ExileLifeCriminalRecord",[]];
    _armed = 0;
    if !(_criminalRecord isEqualTo [])then{
        _armed = _criminalRecord select 1;
    };
    _dbPID = _playerObject getVariable ["ExileLifePID",-1];
	[_dbPID,"SYSTEM",1,_armed] call ExileLifeServer_system_prisonRecords_updateCriminalRecord;
    _crimeDesc = "STOLEN HIRE VEHICLE";
    _itemsArray = [];
    _cashAmount = 0;
    _infractionID = format["createPrisonerInfraction:%1:%2:%3:%4:%5:%6",_dbPID,"SYSTEM",_crimeDesc,_itemsArray,_cashAmount,_armed] call ExileServer_system_database_query_insertSingle;
};
_result
