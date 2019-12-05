/**
                    * ExilelifeClient_system_rewards_network_hasRewardsResponse
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_responseCode","_rewardsData","_dialog","_listBox"];
_responseCode = _this select 0;
_rewardsData = _this select 1;
ExileClientIsWaitingForServerTradeResponse = false;
if (_responseCode isEqualTo 0) then
{
	ExileLifeClientPlayerRewards = _rewardsData;
	if(count ExileLifeClientPlayerRewards != 0) then {
		["SuccessTitleAndText", ["Rewards Added!", "You have new rewards to claim!"]] call ExileClient_gui_toaster_addTemplateToast;
	};
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
	["ErrorTitleAndText", ["Whoops!", format ["Something went really wrong. Please tell a server admin that you got updated rewards and tell them the code '%1'. Thank you!", _responseCode]]] call ExileClient_gui_toaster_addTemplateToast;
};
