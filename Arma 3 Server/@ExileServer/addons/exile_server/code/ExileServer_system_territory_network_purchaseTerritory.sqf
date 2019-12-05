/**
                    * ExileServer_system_territory_network_purchaseTerritory
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

                    private["_sessionID","_parameters","_territoryGang","_player","_price","_playerMoney","_gangBankName","_gangBankBalance","_newgangBankBalance","_territoryPrice","_logging","_territoryLog"];
_sessionID = _this select 0;
_parameters = _this select 1;
_territoryGang = _parameters select 0;
try
{
	_player = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _player) then
	{
		throw 1;
	};
	if !(alive _player) then
	{
		throw 2;
	};
	_price = ((getArray(missionConfigFile >> "CfgTerritories" >> "prices")) select 0) select 0;
	_playerMoney = _player getVariable ["ExileMoney", 0];
	if (_price > _playerMoney) then
	{
		throw 3;
	};
	_playerMoney = _playerMoney - _price;
	_player setVariable ["ExileMoney", _playerMoney, true];
	format["setPlayerMoney:%1:%2", _playerMoney, _player getVariable ["ExileLifePID", -1]] call ExileServer_system_database_query_fireAndForget;
	_gangBankName = format ["ExileLifeGangBank:%1",_territoryGang];
	_gangBankBalance = missionNamespace getVariable [_gangBankName,-1];
	_newgangBankBalance = _gangBankBalance + _territoryPrice;
	missionNamespace setVariable [_gangBankName,_newgangBankBalance];
	format["updateGangBank:%1:%2",_newgangBankBalance,_territoryGang] call ExileServer_system_database_query_fireAndForget;
	[_sessionID, "purchaseTerritoryResponse" , [0]] call ExileServer_system_network_send_to;
	_logging = getNumber(configFile >> "CfgSettings" >> "Logging" >> "territoryLogging");
	if (_logging isEqualTo 1) then
	{
		_territoryLog = format ["PLAYER ( %1 ) %2 PAID %3 POP TABS TO PURCHASE A TERRITORY FLAG | PLAYER TOTAL POP TABS: %4",getPlayerUID _player,_player,_price,_playerMoney];
		[_territoryLog,"Territory"] call ExileLifeServer_util_A3Log;
	};
}
catch 
{
	[_sessionID, "purchaseTerritoryResponse" , [_exception]] call ExileServer_system_network_send_to;
};
true
