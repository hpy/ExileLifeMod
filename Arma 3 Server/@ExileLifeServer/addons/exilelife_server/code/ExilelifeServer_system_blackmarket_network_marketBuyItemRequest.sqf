/**
                    * ExilelifeServer_system_blackmarket_network_marketBuyItemRequest
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

                    private["_sessionID","_package","_itemClassName","_quantity","_storageLocation","_storageNetID","_playerObject","_vehicleObject","_itemArray","_dbStock","_playerMoney","_price","_responseCode"];
_sessionID = _this select 0;
_package = _this select 1;
_itemClassName = _package select 0;
_quantity = _package select 1;
_storageLocation = _package select 2;
_storageNetID = _package select 3;
try
{
    _playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (_playerObject getVariable ["ExileMutex",false]) then
	{
		throw 12;
	};
	_playerObject setVariable ["ExileMutex",true];
	_vehicleObject = objNull;
	if (isNull _playerObject) then
	{
		throw 1;
	};
	if !(alive _playerObject) then
	{
		throw 2;
	};
    _itemArray = format["getMarketItem:%1",_itemClassName] call ExileServer_system_database_query_selectSingle;
    if (isNil "_itemArray") then
    {
        throw 3
    };
    _dbStock = parseNumber(_itemArray select 1);
    if (_quantity > _dbStock) then
    {
        throw 15;
    };
    _playerMoney = _playerObject getVariable ["ExileMoney",0];
    _price = -1;
    if (isClass (missionConfigFile >> "CfgExileLifeBlackMarket" >> "Inventory" >> _itemClassName)) then
    {
        _price = getNumber(missionConfigFile >> "CfgExileLifeBlackMarket" >> "Inventory" >> _itemClassName >> "price");
    }
    else
    {
        if (isClass (missionConfigFile >> "CfgExileArsenal" >> _itemClassName)) then
        {
            _price = getNumber(missionConfigFile >> "CfgExileArsenal" >> _itemClassName >> "price");
        };
    };
    if (_price <= 0) then
    {
        throw 4;
    };
    if (_playerMoney < _price) then
    {
        throw 5
    };
	_playerMoney = _playerMoney - _price;
	_playerObject setVariable ["ExileMoney", _playerMoney, true];
	format["setPlayerMoney:%1:%2", _playerMoney, _playerObject getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;
    ["REMOVE",_itemClassName,_quantity] call ExileLifeServer_system_blackmarket_database_merp;
    [_sessionID, "marketBuyItemResponse", [0, _price, _itemClassName, 1, _storageLocation, _storageNetID]] call ExileServer_system_network_send_to;
    if !(_vehicleObject isEqualTo objNull) then
    {
        _vehicleObject call ExileServer_object_vehicle_database_update;
    }
    else
    {
        _playerObject call ExileServer_object_player_database_update;
    };
}
catch
{
    [_sessionID, "marketBuyItemResponse", [_responseCode, 0, "", 0, 0, ""]] call ExileServer_system_network_send_to;
};
_playerObject setVariable ["ExileMutex",false];
true
