/**
                    * ExilelifeClient_interactions_smelter_gasmains
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_interactionname","_zone","_number","_response","_soundobject","_soundsource","_list","_object","_interactionmsg"];
_interactionname = _this select 0;
_zone = _this select 1;
_number = _this select 2;
_response = true;
_soundobject = false;
_soundsource = format ["ExileLifeSound_%1_%2",_zone,_interactionname];
_list = position player nearObjects ["Land_HelipadEmpty_F",10];
{
	if (_x getVariable [_soundsource,false]) exitWith
	{
		_object = _x;
		_soundobject = true;
	};
}forEach _list;
if !(_soundobject) then
{
	_object = createVehicle ["Land_HelipadEmpty_F", position player, [], 0, "CAN_COLLIDE"];
	_object setPosATL position player;	
	_object setVariable [_soundsource,true,true];
};
	[_object,"ExileLife_Sound_PipeSqueak",-1,false,-1] call ExileLifeClient_system_environment_network_playSoundRequest;
	_interactionmsg = getText(missionconfigFile >> "CfgExileLifeInteraction" >> _zone >> _interactionname >> "interactionsuccess");
	["SuccessTitleAndText", ["Success!", _interactionmsg]] call ExileClient_gui_toaster_addTemplateToast;
_response
