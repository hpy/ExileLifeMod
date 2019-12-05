/**
                    * ExileServer_system_trading_network_wasteDumpRequest
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

                    private["_sessionID","_parameters","_vehicleNetID","_mode","_vehicleObject","_mutexvarname","_playerObject","_vehicleDBID","_cargo","_revenue","_deleted","_playerMoney","_respectGain","_playerRespect","_logging","_traderLog"];
_this spawn
{
    _sessionID = _this select 0;
    _parameters = _this select 1;
    _vehicleNetID = _parameters select 0;
    _mode = _parameters select 1;
    try
    {
        _vehicleObject = objectFromNetId _vehicleNetID;
        if (isNull _vehicleObject) then
        {
            throw 6;
        };
        _mutexvarname = format["ExileMutex_%1",netId _vehicleObject];
        if (missionNameSpace getVariable [_mutexvarname,false]) then
        {
            throw 12;
        };
        missionNameSpace setVariable [_mutexvarname,true];
        _playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
        if (isNull _playerObject) then
        {
            throw 1;
        };
        if !(alive _playerObject) then
        {
            throw 2;
        };
        if !((owner _vehicleObject) isEqualTo (owner _playerObject)) then
        {
            throw 6;
        };
        _vehicleDBID = _vehicleObject getVariable "ExileDatabaseID";
        _cargo = _vehicleObject call ExileClient_util_containerCargo_list;
        _revenue = _cargo call ExileClient_util_gear_calculateTotalSellPrice;
        clearBackpackCargoGlobal _vehicleObject;
        clearItemCargoGlobal _vehicleObject;
        clearMagazineCargoGlobal _vehicleObject;
        clearWeaponCargoGlobal _vehicleObject;
        _deleted = false;
        if (_mode isEqualTo 2) then
        {
            _revenue = _revenue + ([(typeOf _vehicleObject)] call ExileClient_util_gear_calculateTotalSellPrice);
            _vehicleObject call ExileServer_object_vehicle_remove;
            _vehicleObject setPos [0,0,0];
            _vehicleObject setDamage 1;
            deleteVehicle _vehicleObject;
            _deleted = true;
        }
        else
        {
            _vehicleObject call ExileServer_object_vehicle_database_update;
        };
        _playerMoney = _playerObject getVariable ["ExileMoney", 0];
        _playerMoney = _playerMoney + _revenue;
        _playerObject setVariable ["ExileMoney", _playerMoney, true];
        format["setPlayerMoney:%1:%2", _playerMoney, _playerObject getVariable ["ExileLifePID", -1]] call ExileServer_system_database_query_fireAndForget;
        _respectGain = _revenue * getNumber (configFile >> "CfgSettings" >> "Respect" >> "tradingRespectFactor");
        _playerRespect = _playerObject getVariable ["ExileScore", 0];
        _playerRespect = floor (_playerRespect + _respectGain);
        _playerObject setVariable ["ExileScore", _playerRespect];
        format["setAccountScore:%1:%2", _playerRespect, (getPlayerUID _playerObject)] call ExileServer_system_database_query_fireAndForget;
        [_sessionID, "wasteDumpResponse", [0, _revenue, str _playerRespect]] call ExileServer_system_network_send_to;
        _logging = getNumber(configFile >> "CfgSettings" >> "Logging" >> "traderLogging");
        if (_logging isEqualTo 1) then
        {
            _traderLog = format ["PLAYER: ( %1 ) %2 SOLD ITEM: %3 (ID# %4) with Cargo %5 FOR %6 POPTABS AND %7 RESPECT | PLAYER TOTAL MONEY: %8",getPlayerUID _playerObject,_playerObject,typeOf _vehicleObject,_vehicleDBID,_cargo,_revenue,_respectGain,_playerMoney];
            [_traderLog,"Trading"] call ExileLifeServer_util_A3Log;
        };
        if (_deleted) then
        {
            missionNameSpace setVariable [_mutexvarname,nil];
            if (!isNull _vehicleObject) then
            {
                _vehicleObject setPos [0,0,0];
                _vehicleObject setDamage 1;
                deleteVehicle _vehicleObject;
            };
        }
        else
        {
            missionNameSpace setVariable [_mutexvarname,false];
        };
    }
    catch
    {
        [_sessionID,_exception] call {[_this select 0, "wasteDumpResponse", [_this select 1, 0, ""]] call call ExileServer_system_network_send_to;};
    };
};
true