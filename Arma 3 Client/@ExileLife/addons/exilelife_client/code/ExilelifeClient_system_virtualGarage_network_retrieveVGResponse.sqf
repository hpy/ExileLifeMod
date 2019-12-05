/**
                    * ExilelifeClient_system_virtualGarage_network_retrieveVGResponse
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_responseCode","_vehicleNetID","_vehicleObject","_dialog"];
_responseCode = _this select 0;
_vehicleNetID = _this select 1;
if (_responseCode isEqualTo 0) then
{
	_vehicleObject = objectFromNetId _vehicleNetID;
	ExileLifeVirtualGarage = _this select 2;
	player moveInDriver _vehicleObject;
	_dialog = uiNameSpace getVariable ["RscExileLifeInformation",displayNull];
	if !(isNull _dialog) then
	{
		_dialog closeDisplay 0;
	};
	["SuccessTitleAndText", ["Vehicle Retrieved!"]] call ExileClient_gui_toaster_addTemplateToast;
}
else
{
	["ErrorTitleAndText", ["Whoops!", format ["Something went really wrong. Please tell a server admin that you have tried to retrieve a vehicle from your virtual garage and tell them the code '%1'. Thank you!", _responseCode]]] call ExileClient_gui_toaster_addTemplateToast;
};