/**
                    * ExilelifeClient_system_vehicle_vehicleHire_network_vehicleHireResponse
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_responseCode","_vehicleNetID","_salesPrice","_vehicleObject"];
_responseCode = _this select 0;
_vehicleNetID = _this select 1;
_salesPrice = _this select 2;
if (_responseCode isEqualTo 0) then
{
	closeDialog 0;
	_vehicleObject = objectFromNetId _vehicleNetID;
	player moveInDriver _vehicleObject;
	_vehicleObject setFuelCargo 0;
	if (_salesPrice > 0) then
	{
		["SuccessTitleAndText", ["Vehicle purchased!", format ["-%1<img image='\exile_assets\texture\ui\poptab_inline_ca.paa' size='24'/>", _salesPrice]]] call ExileClient_gui_toaster_addTemplateToast;
	};
}
else
{
	["ErrorTitleAndText", ["Whoops!", format ["Something went really wrong. Please contact a server admin that you have tried to hire a vehicle and tell them the code '%1'. Thank you!", _responseCode]]] call ExileClient_gui_toaster_addTemplateToast;
};
