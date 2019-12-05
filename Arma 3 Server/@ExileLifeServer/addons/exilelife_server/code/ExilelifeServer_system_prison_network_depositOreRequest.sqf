/**
                    * ExilelifeServer_system_prison_network_depositOreRequest
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

                    private["_sessionID","_containsOre","_player","_prisonerMineParams","_prisonerNeedsToMine","_prisonerHasMined","_inventory","_msg","_quantity","_classname","_currentJobArray","_guardVault","_vaultupdated","_vaultLocation","_vaultContents","_index","_oreQuantity"];
_sessionID = _this select 0;
_containsOre = false;
try
{
	_player = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _player) then
	{
		throw "Invalid player.";
	};
	if !(alive _player) then
	{
		throw "Dead player.";
	};
	if !(_player getVariable ["ExileLifePrisoner",false]) then
	{
		throw "You are not a prisoner!";
	};
	_prisonerMineParams = _player getVariable ["ExileLifePrisonerMineAmount",[]]; 
	_prisonerNeedsToMine = _prisonerMineParams select 0;
	_prisonerHasMined = _prisonerMineParams select 1;
	_inventory = _player call ExileClient_util_playerCargo_list;
	if (count _inventory == 0) then
	{
		_msg = format ["You have nothing to deposit! You need to mine another %2 Exium Ore!",_prisonerHasMined,_prisonerNeedsToMine-_prisonerHasMined];
		[_sessionID, "baguetteRequest", [["Labour Camp",_msg]]] call ExileServer_system_network_send_to;
		throw "You dont have any ore!";
	};
	_quantity = 0;
	_classname = "exilelife_item_exiumore";
	{
		if(tolower _x == _classname) then
		{
			_quantity = _quantity + 1;
		};
	}
	forEach _inventory;
	if (_quantity == 0) then
	{
		_msg = format ["You have nothing to deposit! You need to mine another %2 Exium Ore!",_prisonerHasMined,_prisonerNeedsToMine-_prisonerHasMined];
		[_sessionID, "baguetteRequest", [["Labour Camp",_msg]]] call ExileServer_system_network_send_to;
		throw "You dont have any ore!";
	};
	_currentJobArray = format["getPlayerJobsCurrent:%1",_player getVariable ["ExileLifePID",-1]] call ExileServer_system_database_query_selectSingleField;
	if (count _currentJobArray == 0) then
	{
		throw "Error: Current Job doesnt exist!";
	};
	_player call ExileServer_object_player_database_update;
	_guardVault = missionNamespace getVariable ["ExileLifeGangVault:Guard",[]];
	_vaultupdated = false;
	{
		_vaultLocation = _x select 0;
		if (_vaultLocation == "Prison") exitWith
		{
			_vaultContents = _x select 1;
			_index = _forEachIndex;
			{
				if ((_x select 0) == ("exilelife_item_exiumore")) exitWith
				{
					_oreQuantity = (_x select 1) + _quantity;
					_vaultContents set [_forEachIndex,[(_x select 0),_oreQuantity]];
					_guardVault set [_index,["Prison",_vaultContents]];
					missionNamespace setVariable ["ExileLifeGangVault:Guard",_guardVault];
					_vaultupdated = true;
				};
			}
			forEach _vaultContents;
		};
	}
	forEach _guardVault;
	if !(_vaultupdated) then
	{
		_guardVault = _guardVault + [["Prison",[["exilelife_item_exiumore",_quantity]]]];
		missionNamespace setVariable ["ExileLifeGangVault:Guard",_guardVault];
	};
	format["updateGangVault:%1:%2", _guardVault, "Guard"] call ExileServer_system_database_query_fireAndForget;
	_prisonerHasMined = _prisonerHasMined + _quantity;
	_player setVariable ["ExileLifePrisonerMineAmount",[_prisonerNeedsToMine,_prisonerHasMined]];
	format["updatePlayerJobsCurrent:%1:%2",["prison",0,_currentJobArray select 2,_currentJobArray select 3,[_prisonerNeedsToMine,_prisonerHasMined]],_player getVariable ["ExileLifePID",-1]] call ExileServer_system_database_query_fireAndForget;
	if (_prisonerHasMined >= _prisonerNeedsToMine) then
	{
		[_sessionID] call ExilelifeServer_system_jobs_process_network_completeJobRequest;
	}
	else
	{
		_msg = format ["You have mined %1 Ore, you need to mine %2 more!",_prisonerHasMined,_prisonerNeedsToMine-_prisonerHasMined];
		[_sessionID, "baguetteRequest", [["Labour Camp",_msg]]] call ExileServer_system_network_send_to;
	};
	[_sessionID, "depositOreResponse", [_quantity]] call ExileServer_system_network_send_to;
}
catch
{
	_exception call ExileLifeServer_util_debugLog;
};
