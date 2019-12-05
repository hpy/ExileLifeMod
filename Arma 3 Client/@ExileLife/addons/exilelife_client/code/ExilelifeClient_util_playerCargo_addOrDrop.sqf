/**
                    * ExilelifeClient_util_playerCargo_addOrDrop
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

                    private["_playerObject","_itemClassname","_bulletCount","_weGood"];
_playerObject = _this select 0;
_itemClassname = _this select 1;
_bulletCount = [_this, 2, -1] call BIS_fnc_param;
_weGood = [_playerObject,_itemClassname,_bulletCount] call ExileClient_util_playerCargo_add;
if !(_weGood) then
{
	_weGood = _this call ExileLifeClient_util_containerCargo_addOrDrop;
	if !(_weGood) then
	{
		_this call ExileLifeClient_util_world_drop;
	};
};
_weGood
