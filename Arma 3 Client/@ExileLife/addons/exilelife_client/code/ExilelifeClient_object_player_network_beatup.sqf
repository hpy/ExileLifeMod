/**
                    * ExilelifeClient_object_player_network_beatup
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_amountOfDamage","_bleedoutTime"];
_amountOfDamage = _this select 0;
[100] call BIS_fnc_bloodEffect;
[player, _amountOfDamage,true] call ExileLifeClient_util_health_damageAllHitpoints;
if ((floor (random 10)) <= 3) then
{
	[floor (random 30)] call ExileLifeClient_object_player_event_onKnockOut;
};
_bleedoutTime = _amountOfDamage * 100;
if (ExileLifeClientPlayerIsBleeding) then
{
	ExileLifeClientBleedingCountDownEnd = ExileLifeClientBleedingCountDownEnd + _bleedoutTime;
	ExileLifeClientBleedOutRate = ExileLifeClientBleedOutRate + (_amountOfDamage/300);
}
else
{
	ExileLifeClientPlayerIsBleeding = true;
	ExileLifeClientBleedingCountDownEnd = time + _bleedoutTime;
	player setVariable ["ExileLifeClientBleeding",true,true];
	true call ExileLifeClient_gui_hud_toggleBleedingIcon;
};
