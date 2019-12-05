/**
                    * ExilelifeServer_resources_mine_network_chopRockRequest
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

                    private["_sessionId","_parameters","_rockNetId","_minetype","_rock","_limited","_isRock","_rockModelNames","_typeofmine","_foundItem","_timesmined","_rockID","_rockmined","_itemClassName","_amount","_player","_sessionID","_i","_rockHeight"];
_sessionId = _this select 0;
_parameters = _this select 1;
_rockNetId = _parameters select 0;
_minetype = _parameters select 1;
_rock = objectFromNetId _rockNetId;
_limited = true;
if (!isNull _rock) then
{
	_isRock = false;
	_rockModelNames = getArray(missionConfigFile >> "CfgInteractionModels" >> "StoneSource" >> "models");
	{
		if !(((str _rock) find _x) isEqualTo -1)exitWith {_isRock = true};
	}
	forEach _rockModelNames;
	if (_isRock) then
	{
		if (alive _rock) then
		{
			switch (_minetype) do
			{
			    case "Gold": {_typeofmine = ExileLifeGoldMine; };
			    case "Iron": { _typeofmine = ExileLifeIronMine; };
			    case "Exium": {_limited = false;};
			};
			_foundItem = false;
			_timesmined = 0;
			if (_limited) then
			{
				{
	    			_rockID = _x select 0;
	    			_rockmined = _x select 1;
	   				if (_rockID isEqualTo _rockNetId) exitWith
	    			{
	        			_foundItem = true;
	        			_timesmined = _rockmined + 1;
	           			_typeofmine set [_forEachIndex, [_rockID, _timesmined]];
	    			};
				}
				forEach _typeofmine;
				if !(_foundItem) then
				{
					_typeofmine pushBack [_rockNetId, 1];
				};
			};
			switch (_minetype) do
			{
			    case "Gold": {ExileLifeGoldMine = _typeofmine; _itemClassName = "ExileLife_Item_GoldOre";};
			    case "Iron": {ExileLifeIronMine = _typeofmine; _itemClassName = "ExileLife_Item_IronOre";};
			    case "Exium": {_itemClassName = "ExileLife_Item_ExiumOre";};
			};
			_amount = floor random [1,2,3];
			_player = _sessionID call ExileServer_system_session_getPlayerObject;
			for "_i" from 1 to _amount do
			{
				[_player,_itemClassName] call ExileLifeClient_util_playerCargo_addOrDrop;
			};
			[_sessionID,["Strength",10]] call ExileLifeServer_object_player_skills_network_updateSkillRequest;
			_rockHeight = _rock call ExileClient_util_model_getHeight;
			_rockHeight = (floor _rockHeight) max 1;
			if (_timesmined > _rockHeight) then
			{
				hideObjectGlobal _rock;
			};
			[_sessionID, "toastRequest", ["SuccessTitleOnly", [format["You found %1 %2 Ore!",_amount,_minetype]]]] call ExileServer_system_network_send_to;
		};
	};
};
true
