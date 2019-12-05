/**
                    * ExilelifeClient_action_testBlood_condition
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_bloodVial","_cancel","_bloodConfig"];
_bloodVial = _this;
_cancel = "";
try 
{
	if (isNull player) then
	{
		throw "You dont exist...";
	};
	if !(alive player) then
	{
		throw "You died! :(";
	};
	if (player getVariable ['ExileLifeClientIncapacitated', false]) then
	{
		throw "You are in a revive state";
	};
	if !([player,"ExileLife_Item_BloodTestKit"] call ExileLifeClient_util_playercargo_contains) then 
	{
		throw "You don't have a blood test kit";
	};
	if !([player,_bloodVial] call ExileLifeClient_util_playercargo_contains) then 
	{
		throw "You seem to have lost the blood vial?";
	};
	_bloodConfig = configFile >> "CfgMagazines" >> _bloodVial;
	if (getText(_bloodConfig >> "bloodType") isEqualTo "")then{
		throw "This is not a blood vial";
	};
	if (getNumber(_bloodConfig >> "typeKnown") isEqualTo 1)then{
		throw "You already know this blood type";
	};
}
catch 
{
	_cancel = _exception;
};
_cancel