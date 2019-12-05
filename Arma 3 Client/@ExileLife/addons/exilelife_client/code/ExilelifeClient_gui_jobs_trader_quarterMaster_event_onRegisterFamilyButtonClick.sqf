/**
                    * ExilelifeClient_gui_jobs_trader_quarterMaster_event_onRegisterFamilyButtonClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_nameInput","_familyName","_registrationFee","_alphabet","_clanNameLength","_forbiddenCharacter"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileLifeInformation",displayNull];
_nameInput = _display displayCtrl 16114;
_familyName = ctrlText _nameInput;
_registrationFee = getNumber (missionConfigFile >> "CfgClans" >> "registrationFee");
_alphabet = getText (missionConfigFile >> "CfgClans" >> "clanNameAlphabet");
try 
{
	_familyName = _familyName call ExileClient_util_string_trim;
	if ((player getVariable ["ExileMoney", 0]) < _registrationFee) then 
	{
		throw "You do not have enough pop tabs to register a family.";
	};
	_clanNameLength = count _familyName;
	if (_clanNameLength isEqualTo 0) then 
	{
		throw "Please enter a name.";
	};
	if (_clanNameLength < 2) then 
	{
		throw "Name is too short.";
	};
	if (_clanNameLength > 20) then
	{
		throw "Name is longer than 20 letters.";
	};
	_forbiddenCharacter = [_familyName, _alphabet] call ExileClient_util_string_containsForbiddenCharacter;
	if !(_forbiddenCharacter isEqualTo -1) then 
	{
		throw format ["Do not use '%1' in your family name.", _forbiddenCharacter];
	};
	["registerClanRequest", [_familyName]] call ExileClient_system_network_send;
	closeDialog 0;
	ExileLifeTempParams = nil;
}
catch 
{
	["ErrorTitleAndText", ["Failed to register family!", _exception]] call ExileClient_gui_toaster_addTemplateToast;
};
true