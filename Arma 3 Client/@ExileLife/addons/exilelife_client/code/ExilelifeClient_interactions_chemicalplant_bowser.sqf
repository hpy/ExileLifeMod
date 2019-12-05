/**
                    * ExilelifeClient_interactions_chemicalplant_bowser
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_interactionname","_zone","_number","_response","_soundobject","_soundsource","_chemicalname","_chemicaltype","_hasACan","_magazines","_hasaCan","_list","_object","_myFunction","_threadID","_dir","_pos","_interactionmsg"];
_interactionname = _this select 0;
_zone = _this select 1;
_number = _this select 2;
_response = true;
_soundobject = false;
_soundsource = format ["ExileLifeSound_%1_%2",_zone,_interactionname];
_chemicalname = "";
try
{
	switch (_number) do
	{
		case 1:	{ throw "ExileLife_Item_HydrochloricAcid" };
		case 2:	{ throw "ExileLife_Item_Acetone" };
		case 3:	{ throw "ExileLife_Item_PhosphoricAcid" };
		case 4:	{ throw "ExileLife_Item_Hydrazine" };
	};
}
catch
{
	_chemicaltype = _exception;
};
_hasACan = false;
_magazines = magazinesAmmo player;
{
	if((_x select 0) isEqualTo "Exile_Item_FuelCanisterEmpty") exitWith
	{
		_hasaCan = true;
	};
}
forEach _magazines;
if(_hasACan)then
{
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
	[_object,"ExileLife_Sound_FuelPump",-1,false,-1] call ExileLifeClient_system_environment_network_playSoundRequest;
	[true] call ExileLifeClient_object_player_action_holsterweapon;
	_myFunction = {player switchmove "Acts_AidlPercMstpSloWWpstDnon_warmup_2_loop"};
	_threadID = [1.5, _myFunction, [], false,"Animation"] call ExileClient_system_thread_addtask;
	_myFunction =
	{
		if !(animationState player == "acts_aidlpercmstpsnonwnondnon_warmup_2") exitWith {};
 		_dir = getDir player;
 		_pos = player modelToWorld [0.5,0.6,0];
 		simpleObject = "Land_CanisterFuel_f" createVehicle _pos;
 		simpleObject setPosATL _pos;
 		simpleObject setDir (_dir - 90);
 		playercam = "camera" camcreate [0,0,0];
 		playercam cameraeffect ["internal", "back"];
 		playercam camsettarget player;
 		playercam camsetrelpos [-2,2,3];
 		playercam camcommit 0;
 		player switchCamera "playercam";
		[ExileLifeClientAnimationThread] call ExileClient_system_thread_removeTask;
		ExileLifeClientAnimationThread = nil;
	};
	ExileLifeClientAnimationThread = [0.1, _myFunction, [], true,"Animation"] call ExileClient_system_thread_addtask;
	_myFunction =
	{
		[
			player,
			["Exile_Item_FuelCanisterEmpty",1],
			[_this select 0,20]
		] call ExileClient_util_inventory_replaceMagazine;
		call ExileClient_object_player_save;
		_interactionmsg = getText(missionconfigFile >> "CfgExileLifeInteraction" >> _this select 0 >> _this select 1 >> "interactionsuccess");
		["SuccessTitleAndText", ["Success!", _interactionmsg]] call ExileClient_gui_toaster_addTemplateToast;
		playercam cameraEffect ["terminate","back"];
		camDestroy playercam;
		deleteVehicle simpleObject;
		player switchmove "";
		simpleObject = nil;
		playercam = nil;
	};
    _threadID = [16, _myFunction, [_chemicaltype,_zone,_interactionname], false,"Canister Fill"] call ExileClient_system_thread_addtask;
}
else
{
	_response = false;
	["ErrorTitleOnly", ["ChemicalPumpFailed!"]] call ExileClient_gui_toaster_addTemplateToast;
};
_response
