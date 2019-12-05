/**
                    * ExilelifeClient_system_rewards_network_claimVehicleResponse
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_responseCode","_vehicleNetID","_vehicleObject"];
_responseCode = _this select 0;
_vehicleNetID = _this select 1;
ExileLifeClientPlayerRewards = _this select 2;
if (_responseCode isEqualTo 0) then
{
	_vehicleObject = objectFromNetId _vehicleNetID;
	player moveInDriver _vehicleObject;
	["SuccessTitleAndText", ["Vehicle claimed!", "Your reward has been successfully claimed"]] call ExileClient_gui_toaster_addTemplateToast;
}
else 
{
	["ErrorTitleAndText", ["Whoops!", format ["Something went really wrong. Please tell a server admin that you have tried to claim a vehicle and tell them the code '%1'. Thank you!", _responseCode]]] call ExileClient_gui_toaster_addTemplateToast;
};