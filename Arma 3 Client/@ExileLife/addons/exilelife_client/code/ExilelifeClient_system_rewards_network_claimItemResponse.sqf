/**
                    * ExilelifeClient_system_rewards_network_claimItemResponse
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_responseCode","_itemClassName","_containerType","_containerNetID","_containersBefore","_vehicle","_dialog","_listBox"];
_responseCode = _this select 0;
_itemClassName = _this select 1;
_containerType = _this select 2;
_containerNetID = _this select 3;
ExileLifeClientPlayerRewards = _this select 4;
ExileClientIsWaitingForServerTradeResponse = false;
if (_responseCode isEqualTo 0) then
{
	switch (_containerType) do
	{
		case 1:
		{
			_containersBefore = [uniform player, vest player, backpack player];
			[player, _itemClassName] call ExileClient_util_playerCargo_add;
		};
		case 2:
		{
			_vehicle = objectFromNetId _containerNetID;
			[_vehicle, _itemClassName] call ExileClient_util_containerCargo_add;
		};
	};
	["SuccessTitleAndText", ["Item claimed!", "Your reward has been successfully claimed"]] call ExileClient_gui_toaster_addTemplateToast;
	_dialog = uiNameSpace getVariable ["RscExileLifeRewardsDialog", displayNull];
	if !(_dialog isEqualTo displayNull) then
	{
		call ExileLifeClient_gui_rewardsDialog_updateListBox;
		call ExileLifeClient_gui_rewardsDialog_updateSelection;
		_listBox = _dialog displayCtrl 2003;
		[_listBox, lbCurSel _listBox] call ExileLifeClient_gui_rewardsDialog_event_onListBoxSelectionChanged;
	};
}
else 
{
	["ErrorTitleAndText", ["Whoops!", format ["Something went really wrong. Please tell a server admin that you have tried to claim an item and tell them the code '%1'. Thank you!", _responseCode]]] call ExileClient_gui_toaster_addTemplateToast;
};