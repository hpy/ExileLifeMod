/**
                    * ExilelifeClient_object_player_action_holsterweapon
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_holster"];
_holster = _this select 0;
if (_holster) then 
{
	ExileLifeCurrentWeapon = currentWeapon player;
	player action ["SwitchWeapon", player, player, 100];
}
else
{
	player selectWeapon ExileLifeCurrentWeapon;
};	
true