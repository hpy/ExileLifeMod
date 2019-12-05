/**
                    * ExilelifeServer_system_jobs_util_items_add
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

                    private["_playerObject","_items","_weGood","_canFitChck","_type","_package","_itemClassname","_itemQuantity","_i","_playerUID","_sessionID"];
_playerObject = _this select 0;
_items = _this select 1;
_weGood = false;
_canFitChck = -1;
{
	_type = _x select 0;
	_package = _x select 1;
	switch (_type) do
	{
		case ("PHYSICAL"):
		{
			_itemClassname = _package select 0;
			_itemQuantity = _package select 1;
			for "_i" from 1 to _itemQuantity do
			{
				_weGood = [_playerObject,_itemClassname] call ExileLifeClient_util_playerCargo_addOrDrop;
				if !(_weGood) then
				{
					_canFitChck = _canFitChck + 1;
				};
			};
		};
	};
	if !(_weGood) exitWith {};
}
forEach _items;
if (_canFitChck > -1) then
{
	_weGood = true;
	_playerUID = getPlayerUID _playerObject;
	_sessionID = _playerUID call ExileLifeServer_system_session_getIDfromUID;
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["NOTICE!", "You didn't have enough room in your inventory, items have been dropped on the ground!"]]] call ExileServer_system_network_send_to;
};
_weGood
