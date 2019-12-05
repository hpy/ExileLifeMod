/**
                    * ExilelifeClient_gui_claimHouseDialog_event_onPlaceButtonClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_territoryName","_alphabet","_forbiddenCharacter"];
_display = uiNameSpace getVariable ["RscExileLifeClaimHouseDialog", displayNull];
_territoryName = ctrlText (_display displayCtrl 4000);
try
{
	if((count _territoryName) isEqualTo 0) then 
	{
		throw "Please enter a base name!";
	};
	_territoryName = _territoryName call ExileClient_util_string_trim;
	_alphabet = getText (missionConfigFile >> "CfgClans" >> "clanNameAlphabet");
	_forbiddenCharacter = [_territoryName, _alphabet] call ExileClient_util_string_containsForbiddenCharacter;
	if !(_forbiddenCharacter isEqualTo -1) then 
	{
		throw "Invalid character in input. Please try again.";
	};
	["ExileLife_Item_SleepingBag",_territoryName] call ExileClient_construction_beginNewObject; 
}
catch
{
	["ErrorTitleAndText", ["Failed to place sleeping mat!", _exception]] call ExileClient_gui_toaster_addTemplateToast;
};
closeDialog 0;
true