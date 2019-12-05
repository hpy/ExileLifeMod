/**
                    * ExilelifeServer_util_ai_spawnSoldier
                    *
                    * Exile Mod
                    * www.exilemod.com
                    * © 2016 Exile Mod Team
                    *
                    * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
                    * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
                    * 
                    * Permission granted to ExileLife Dev Team to overwrite files and redistribute them
                    *
                    */

                    private["_position","_customItems","_skill","_rank","_unit","_headgear","_clothing","_backpack","_vest","_pistol","_primaryWeapon"];
_position = _this select 0;
_group = _this select 1;
_customItems = _this param [2,[]];
_skill = _this param [3,"medium"];
_rank = _this param [4,""]; 
_unit = _group createUnit ["O_recon_F", _position, [], 0,"NONE"];
_unit allowFleeing 0;
_unit call ExileClient_util_playerEquipment_clear;
switch (toLower _skill) do
{
	case "easy":
	{
		_skill = [["aimingAccuracy",0.25],["aimingShake",0.25],["aimingSpeed",0.50],["spotDistance",0.25],["spotTime",0.25],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",0.25]];
		_unit disableAI "CHECKVISIBLE";
		_unit enableStamina false;
	};
	case "medium":
	{
		_skill = [["aimingAccuracy",0.50],["aimingShake",0.50],["aimingSpeed",0.50],["spotDistance",0.50],["spotTime",0.50],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",0.50]];
		_unit disableAI "CHECKVISIBLE";
		_unit enableStamina false;
	};
	case "hard":
	{
		_skill = [["aimingAccuracy",0.75],["aimingShake",0.75],["aimingSpeed",0.75],["spotDistance",0.75],["spotTime",0.75],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",0.75]];
		_unit enableStamina true;
	};
	case "extreme":
	{
		_skill = [["aimingAccuracy",1.00],["aimingShake",1.00],["aimingSpeed",1.00],["spotDistance",1.00],["spotTime",1.00],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",1.00]];
		_unit enableStamina true;
		{
			_unit disableAI _x;
		} forEach ["SUPPRESSION", "AIMINGERROR"];
	};
	default {};
};
{
	_unit setSkill _x;
} forEach _skill;
if ((count _customItems) > 0) then
{
	_headgear = selectRandom(_customItems select 0);
	if ((count _customItems) > 1) then
	{
		_clothing = selectRandom(_customItems select 1);
		if ((count _customItems) > 2) then
		{
			_backpack = selectRandom(_customItems select 2);
			if ((count _customItems) > 3) then
			{
				_vest = selectRandom(_customItems select 3);
				if ((count _customItems) > 4) then
				{
					_pistol = selectRandom(_customItems select 4);
					if ((count _customItems) > 5) then
					{
						_primaryWeapon = selectRandom(_customItems select 5);
					};
				};
			};
		};
	};
}
else
{
	_headgear = selectRandom  ExileLife_AI_Helmets;
	_clothing = selectRandom  ExileLife_AI_Clothing;
	_backpack = selectRandom  ExileLife_AI_Backpacks;
	_vest = selectRandom  ExileLife_AI_Vests;
	_pistol = selectRandom  ExileLife_AI_Pistols;
	_primaryWeapon = selectRandom  ExileLife_AI_Assault;
};
if !(isNil "_headgear") then
{
	_unit addHeadgear _headgear;
};
if !(isNil "_clothing") then
{
	_unit forceAddUniform _clothing;
};
if !(isNil "_vest") then
{
	_unit addVest _vest;
};
if !(isNil "_backpack") then
{
	_unit addBackpackGlobal _backpack;
};
{
	[_unit,_x] call ExileClient_util_playerEquipment_add;
}forEach [_pistol,_primaryWeapon];
if (ExileLifeServerSunMoonCycle isEqualTo 0) then
{
	_unit linkItem "NVGoggles";
	_unit addPrimaryWeaponItem (selectRandom ["acc_flashlight","acc_pointer_IR"]);
};
