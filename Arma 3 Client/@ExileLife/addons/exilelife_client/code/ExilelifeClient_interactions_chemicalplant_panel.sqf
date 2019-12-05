/**
                    * ExilelifeClient_interactions_chemicalplant_panel
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_interactionname","_zone","_number","_response","_soundobject","_soundsource","_interactionsource","_list","_object","_interactionthreadID","_soundsourcenumber","_myFunction","_threadID","_interactionmsg"];
_interactionname = _this select 0;
_zone = _this select 1;
_number = _this select 2;
_name = _this select 3;
_response = true;
_soundobject = false;
_soundsource = format ["ExileLifeSound_%1_%2",_zone,_name];
_interactionsource = format ["ExileLifeInteraction_%1_%2",_zone,_name];
_list = position player nearObjects ["Land_HelipadEmpty_F",10];
{
	if (_x getVariable [_soundsource,-1] > 0) exitWith
	{
		_object = _x;
		_soundobject = true;
	};
}forEach _list;
if !(_soundobject) then
{
	_object = createVehicle ["Land_HelipadEmpty_F", position player, [], 0, "CAN_COLLIDE"];
	_object setPosATL position player;
	_object setVariable [_soundsource,_number,true];
};
_interactionthreadID = _object getVariable [_interactionsource,-1];
if !(_interactionthreadID isEqualto 0) then
{
	[_interactionthreadID]  call ExileClient_system_thread_removeTask; 
};
_soundsourcenumber = _object getVariable [_soundsource,-1];
if (!(_soundsourcenumber isEqualTo _number) && !(_soundsourcenumber isEqualTo -1)) then
{
	[_object,"ExileLife_Sound_KeypadFail",-1,false,-1] call ExileLifeClient_system_environment_network_playSoundRequest;
	_interactionname = format ["%1%2%3",_name,0,_soundsourcenumber];
	["interactionDisable", [_interactionname,_zone]] call ExileClient_system_network_send;
	_object setVariable [_soundsource,_number,true];
    _myFunction =
    {
		[_this select 0,"ExileLife_Sound_KeypadSuccess",-1,false,-1] call ExileLifeClient_system_environment_network_playSoundRequest;
    };
    _threadID = [2, _myFunction, [_object], false,"Play Sound"] call ExileClient_system_thread_addtask;
        _myFunction =
    {
		[_this select 0,"ExileLife_Sound_FactoryStartup",-1,false,-1] call ExileLifeClient_system_environment_network_playSoundRequest;
    };
    _threadID = [5, _myFunction, [_object], false,"Play Sound"] call ExileClient_system_thread_addtask;
 	_object setVariable [_interactionsource,_threadID,true];
}
else
{
	[_object,"ExileLife_Sound_KeypadSuccess",-1,false,-1] call ExileLifeClient_system_environment_network_playSoundRequest;
    _myFunction =
    {
		[_this select 0,"ExileLife_Sound_FactoryStartup",-1,false,-1] call ExileLifeClient_system_environment_network_playSoundRequest;
    };
    _threadID = [3, _myFunction, [_object], false,"Play Sound"] call ExileClient_system_thread_addtask;
};
	_interactionmsg = getText(missionconfigFile >> "CfgExileLifeInteraction" >> _zone >> _interactionname >> "interactionsuccess");
	["SuccessTitleAndText", ["Success!", _interactionmsg]] call ExileClient_gui_toaster_addTemplateToast;
_response
