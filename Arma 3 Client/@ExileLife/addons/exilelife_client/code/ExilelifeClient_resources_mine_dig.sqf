/**
                    * ExilelifeClient_resources_mine_dig
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_pile","_surfaceType","_rock"];
_pile = _this;
try
{
	if (_pile getVariable ["ExileLifeMinedOut",false]) then
	{
		throw "This has already been searched...";
	};
	_pile setVariable ["ExileLifeMinedOut",true,true];
	_surfaceType = _pile getVariable ['ExileLifeSurfaceType',''];
	['digRequest', [_surfaceType,ExileLifeResourceType]] call ExileClient_system_network_send;
}
catch
{
	["ErrorTitleandText", [_exception]] call ExileClient_gui_toaster_addTemplateToast;
};
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
