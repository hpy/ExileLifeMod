/**
                    * ExilelifeClient_object_player_event_handleBulletCollection
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_ammo","_casingName","_cartridge"];
_ammo = _this;
if (random(1) < (["spentShellCollectionChance", 0] call ExileLifeClient_system_attribute_getValue)) then 
{
	_casingName = getText(configFile >> "CfgWeapons" >> (currentWeapon player) >> "ExileLife" >> "casing");
	if !(_casingName isEqualTo "") then 
	{
		_cartridge = getText(configFile >> "CfgAmmo" >> _ammo >> "cartridge");
		if ((_cartridge find "caseless") isEqualTo -1) then 
		{
			[player, _casingName] call ExileClient_util_playerCargo_add;
		};
	};
};