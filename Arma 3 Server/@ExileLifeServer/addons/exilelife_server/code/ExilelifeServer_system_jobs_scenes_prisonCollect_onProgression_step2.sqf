/**
                    * ExilelifeServer_system_jobs_scenes_prisonCollect_onProgression_step2
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

                    private["_sessionID","_playerObject","_jobClassname","_position","_result","_vehicleNetId","_vehicle","_guardVault","_oreRemoved","_oreQuantity","_vaultLocation","_index","_vaultContents"];
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
        throw "Vehicle does not exist";
    };
    if !(alive _vehicle) then {
        throw "Vehicle is destroyed";
    };
    if (_playerObject distance _vehicle > 15) then {
        throw "Vehicle is parked too far away!";
    };
	_guardVault = missionNamespace getVariable ["ExileLifeGangVault:Guard",[]];
    _oreRemoved = 0;
    _oreQuantity = 0;
	{
		_vaultLocation = _x select 0;
        _index = _forEachIndex;
		if (_vaultLocation == "Prison") exitWith
		{
			_vaultContents = _x select 1;
			{
				if ((_x select 0) == ("exilelife_item_exiumore")) exitWith
				{
					_oreQuantity = _x select 1;
                    if(_oreQuantity > 5000) then {
                        _oreRemoved = 5000;
                        _oreQuantity = _oreQuantity - 5000;
                    }else{
                        _oreRemoved = _oreQuantity ;
                        _oreQuantity = 0;
                    };
                    _vaultContents set [_forEachIndex,[(_x select 0),_oreQuantity]];
					_guardVault set [_index,["Prison",_vaultContents]];
					missionNamespace setVariable ["ExileLifeGangVault:Guard",_guardVault];
				};
			}forEach _vaultContents;
		};
	}forEach _guardVault;
	format["updateGangVault:%1:%2", _guardVault, "Guard"] call ExileServer_system_database_query_fireAndForget;
    _vehicle setVariable ["ExileLifeJobCargo",[["exilelife_item_exiumore",_oreRemoved]],true];
}
catch
{
    _result = _exception;
};
_result
