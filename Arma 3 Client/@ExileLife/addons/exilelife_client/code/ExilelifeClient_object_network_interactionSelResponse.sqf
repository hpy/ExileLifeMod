/**
                    * ExilelifeClient_object_network_interactionSelResponse
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_parameters","_responseCode","_interactionname","_zone","_alreadyrunning","_number","_callfunction","_response"];
_parameters = _this;
_responseCode = _parameters select 0;
_interactionname = _parameters select 1;
_zone = _parameters select 2;
_alreadyrunning = _parameters select 3;
if (_responseCode isEqualTo "OK") then
{
	_number = str(parseNumber _interactionname);
	_name = _interactionname splitString _number;
	_callfunction = call compile format ["ExileLifeClient_interactions_%1_%2",_zone,_name select 0];
	_response = [_interactionname,_zone,parsenumber(_name select 1),_name select 0] call _callfunction;
	if !(_response) then
	{
		["interactionDisable", [_interactionname,_zone]] call ExileClient_system_network_send;
	};
}
else
{
	["ErrorTitleOnly", [_responseCode]] call ExileClient_gui_toaster_addTemplateToast;
};
ExileLifeClientInteractionChk = false;
