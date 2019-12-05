/**
                    * ExilelifeClient_object_handcuffs_network_forceGetOutResponse
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_victimNetID","_vehicleNetID","_vehicle","_victim"];
_victimNetID = _this select 0;
_vehicleNetID = _this select 1;
_vehicle = objectFromNetId _vehicleNetID;
_victim = objectFromNetId _victimNetID;
try 
{
	if !(ExileClientIsHandcuffed) then 
	{
		throw "You cannot force a free person out of a car!"; 
	};
	if !(isPlayer _victim) then
	{
		throw "You cannot force an unknown person out of a car!"; 
	};	
	if !(alive _victim) then
	{
		throw "You cannot force a dead person out of a car!"; 
	};
	_victim setVariable ["ExileLifeIsForcedGetIn",false,true]; 
	_victim action ["getOut", _vehicle];
	call ExileLifeClient_object_handcuffs_network_forceUpResponse;
	_victim switchmove "AMOVPERCMSTPSNONWNONDNON_EASEOUT";
}
catch 
{
	["ErrorTitleAndText", ["Error!", _exception]] call ExileClient_gui_toaster_addTemplateToast;
};
