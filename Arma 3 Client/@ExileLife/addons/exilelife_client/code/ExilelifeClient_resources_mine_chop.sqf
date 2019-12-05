/**
                    * ExilelifeClient_resources_mine_chop
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_rockModelNames","_rock"];
_rockModelNames = getArray(missionConfigFile >> "CfgInteractionModels" >> "StoneSource" >> "models");
_rock = _rockModelNames call ExileClient_util_model_getLookAt;
if (!isNull _rock) then
{
	if ((_this select 0) < 2) then
	{
		if (ExileLifeClientRockHit > 6) then
		{
			["chopRockRequest", [(netId _rock),ExileLifeResourceType]] call ExileClient_system_network_send;
			ExileLifeClientRockHit = 0;
		}
		else
		{
			ExileLifeClientRockHit = ExileLifeClientRockHit + 1;
		};
	}
	else
	{
		if (ExileLifeClientRockHit > 3) then
		{
			["chopRockRequest", [(netId _rock),ExileLifeResourceType]] call ExileClient_system_network_send;
			ExileLifeClientRockHit = 0;
		}
		else
		{
			ExileLifeClientRockHit = ExileLifeClientRockHit + 1;
		};
	}
};
true
