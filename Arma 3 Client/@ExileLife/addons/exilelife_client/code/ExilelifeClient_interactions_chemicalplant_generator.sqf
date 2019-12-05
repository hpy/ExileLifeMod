/**
                    * ExilelifeClient_interactions_chemicalplant_generator
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_interactionname","_zone","_number","_alreadyrunning","_parameters","_hasACan","_magazines","_response","_soundobject","_timedeletearray","_soundsource","_list","_object","_interactionmsg"];
_interactionname = _this select 0;
_zone = _this select 1;
_number = _this select 2;
_alreadyrunning = _parameters select 3;
_hasACan = false;
_magazines = magazinesAmmo player;
_response = true;
_soundobject = false;
_timedeletearray = getArray(missionConfigFile >> "CfgExileLifeInteraction" >> _zone >> "interactionsounds" >> _interactionname);
_soundsource = "ExileLifeSound_Generator";
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
	_object setVariable ["ExileLifeGenerator",diag_tickTime,true]; 
{
	if((_x select 0) isEqualTo "Exile_Item_FuelCanisterFull")then
	{
		if((_x select 1) isEqualTo 20) exitWith
		{
			_hasACan = true;
		};
	};
	if (_hasACan) exitWith {};
}
forEach _magazines;
if (_hasACan) then
{
	[
		player,
		["Exile_Item_FuelCanisterFull",20],
		["Exile_Item_FuelCanisterEmpty",1]
	] call ExileClient_util_inventory_replaceMagazine;
	call ExileClient_object_player_save;
	[_object,"ExileLife_Sound_GeneratorRunning",1776,true,23] call ExileLifeClient_system_environment_network_playSoundRequest;
	[_object,"ExileLife_Sound_GeneratorOff",-1,false,1773] call ExileLifeClient_system_environment_network_playSoundRequest;
	[_object,"ExileLife_Sound_GeneratorStart",-1,false,-1] call ExileLifeClient_system_environment_network_playSoundRequest;
	[1,position _object,200,1,1798] call ExileLifeClient_system_environment_network_lightsRequest;
	_interactionmsg = getText(missionconfigFile >> "CfgExileLifeInteraction" >> _zone >> _interactionname >> "interactionsuccess");
	["SuccessTitleAndText", ["Success!", _interactionmsg]] call ExileClient_gui_toaster_addTemplateToast;
}
else
{
	if !(_alreadyrunning) then 
	{
		["ErrorTitleAndText", ["No Fuel!", "You need fuel to start the generator!"]] call ExileClient_gui_toaster_addTemplateToast;
		_response = false;
		[_object,"ExileLife_Sound_GeneratorStall",-1,false,-1] call ExileLifeClient_system_environment_network_playSoundRequest;
	};
};
_response
