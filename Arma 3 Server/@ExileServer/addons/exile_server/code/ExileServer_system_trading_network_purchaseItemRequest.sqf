/**
                    * ExileServer_system_trading_network_purchaseItemRequest
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

                    private["_sessionID","_parameters","_itemClassName","_quantity","_containerType","_containerNetID","_playerObject","_vehicleObject","_salesPrice","_traderZone","_tax","_oldSalesPrice","_taxAmount","_playerMoney","_playerRespect","_quality","_requiredRespect","_bankName","_gangBankBalance","_newgangBankBalance","_logging","_traderLog","_responseCode"];
_sessionID = _this select 0;
_parameters = _this select 1;
_itemClassName = _parameters select 0;
_quantity = _parameters select 1;
_containerType = _parameters select 2;
_containerNetID = _parameters select 3;
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
	if (_containerType isEqualTo 5) then 
	{
		_vehicleObject = objectFromNetID(_containerNetID);
		if (isNull _vehicleObject) then 
		{
			throw 6;
		};
	};
	if !(alive _playerObject) then
	{
		throw 2;
	};
	if !(isClass (missionConfigFile >> "CfgExileArsenal" >> _itemClassName) ) then
	{
		throw 3;
	};
	_salesPrice = getNumber (missionConfigFile >> "CfgExileArsenal" >> _itemClassName >> "price");
	if (getNumber(configFile >> "CfgSettings" >> "Escape" >> "enableEscape") isEqualTo 1) then 
	{
		if (_salesPrice < 0) then
		{
			throw 4;
		};
	}
	else
	{
		if (_salesPrice <= 0) then
		{
			throw 4;
		};
		_traderZone = [_playerObject] call ExileLifeClient_util_world_findGangTerritory;
		if (_traderZone == "none") then 
		{
			_traderZone = "Guard";
		};
		_tax = missionNamespace getVariable [format["ExileLifeGangTax:%1",_traderZone],0];
		_oldSalesPrice = _salesPrice;
		_salesPrice =  floor(_salesPrice * ((_tax + 100)/100)); 
		_taxAmount = abs(_salesPrice - _oldSalesPrice);
		_playerMoney = _playerObject getVariable ["ExileMoney", 0];
		if (_playerMoney < _salesPrice) then
		{
			throw 5;
		};
	};
	_playerRespect = _playerObject getVariable ["ExileScore", 0];
	_quality = getNumber(missionConfigFile >> "CfgExileArsenal" >> _itemClassName >> "quality");
	_requiredRespect = getNumber(missionConfigFile >> "CfgTrading" >> "requiredRespect" >> format["Level%1",_quality]);
	if (_playerRespect < _requiredRespect) then
	{
		throw 14;
	};
	if !(getNumber(configFile >> "CfgSettings" >> "Escape" >> "enableEscape") isEqualTo 1) then 
	{
		_bankName = format ["ExileLifeGangBank:%1",_traderZone];
		_gangBankBalance = missionNamespace getVariable [_bankName,-1];
		_newgangBankBalance = _gangBankBalance + _taxAmount;
		missionNamespace setVariable [_bankName,_newgangBankBalance];
		format["updateGangBank:%1:%2",_newgangBankBalance,_traderZone] call ExileServer_system_database_query_fireAndForget;
		_playerMoney = _playerMoney - _salesPrice;
		_playerObject setVariable ["ExileMoney", _playerMoney, true];
		format["setPlayerMoney:%1:%2", _playerMoney, _playerObject getVariable ["ExileLifePID", -1]] call ExileServer_system_database_query_fireAndForget;
	};
	[_sessionID, "purchaseItemResponse", [0, _salesPrice, _itemClassName, 1, _containerType, _containerNetID]] call ExileServer_system_network_send_to;
	_logging = getNumber(configFile >> "CfgSettings" >> "Logging" >> "traderLogging");
	if (_logging isEqualTo 1) then
	{
		_traderLog = format ["PLAYER: ( %1 ) %2 PURCHASED ITEM %3 FOR %4 POPTABS | PLAYER TOTAL MONEY: %5",getPlayerUID _playerObject,_playerObject,_itemClassName,_salesPrice,_playerMoney];
		[_traderLog,"Trading"] call ExileLifeServer_util_A3Log;
	};
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
	_responseCode = _exception;
	[_sessionID, "purchaseItemResponse", [_responseCode, 0, "", 0, 0, ""]] call ExileServer_system_network_send_to;
};	
_playerObject setVariable ["ExileMutex",false];
true
