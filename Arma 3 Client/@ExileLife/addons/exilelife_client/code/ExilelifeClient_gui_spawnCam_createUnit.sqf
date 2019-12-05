/**
                    * ExilelifeClient_gui_spawnCam_createUnit
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_Character","_UnitPosition","_selectClassUnit","_characternumber","_playerData","_bambiCheck","_ExileLifeplayerData","_spawnPreviewUnit","_animations","_headgear","_goggles","_primaryWeapon","_secondaryWeapon","_handgunWeapon","_primaryWeaponItems","_secondaryWeaponItems","_handgunWeaponItems","_weaponItems","_uniform","_vest","_backpack","_currentWeapon","_class","_config","_weapon"];
_Character = _this select 0;
_UnitPosition = _this select 1;
_selectClassUnit = false;
if (count _Character > 0) then
{
	_characternumber = _this select 2;
	_playerData = _Character select 0;
	_bambiCheck = _playerData select 0;
	_ExileLifeplayerData = _Character select 2;
}
else
{
	_characternumber = "";
	_playerData = "";
	_bambiCheck = "";
	_selectClassUnit = true;
};
if (_bambiCheck isEqualTo "bambicharacter") then
{
	if ((ExileLifeClientGuardRights) && (_characternumber isEqualTo "character2")) then 
	{
		_spawnPreviewUnit = "ExileLife_Unit_Guard" createVehiclelocal _UnitPosition;
	}
	else
	{
		_spawnPreviewUnit = "Exile_Unit_Player" createVehiclelocal _UnitPosition;
	};
	_spawnPreviewUnit setVariable ["BIS_enableRandomization", false];
	_spawnPreviewUnit setVariable ["BIS_fnc_animalBehaviour_disable", true];
	_spawnPreviewUnit disableAI "ANIM";
	_spawnPreviewUnit disableAI "MOVE";
	_spawnPreviewUnit disableAI "FSM";
	_spawnPreviewUnit disableAI "AUTOTARGET";
	_spawnPreviewUnit disableAI "TARGET";
	_spawnPreviewUnit disableAI "CHECKVISIBLE";
	_spawnPreviewUnit allowDamage false;
	_spawnPreviewUnit removeAllEventHandlers "HandleDamage";
	_spawnPreviewUnit setVariable ["ExileLifeClientBambi", true];
	_animations = ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"] call BIS_fnc_arrayShuffle;
	_spawnPreviewUnit switchMove (_animations select 0);
	_spawnPreviewUnit setVariable ["ExileAnimations", _animations];
	_spawnPreviewUnit addEventHandler	["AnimDone", {_this call ExileClient_object_trader_event_onAnimationDone}];
}
else
{
	if (ExileLifeClientGuardRights) then
	{
		_spawnPreviewUnit = "ExileLife_Unit_Guard" createVehicleLocal _UnitPosition;
	}
	else
	{
		_spawnPreviewUnit = "Exile_Unit_Player" createVehicleLocal _UnitPosition;
	};
	_spawnPreviewUnit setVariable ["BIS_enableRandomization", false];
	_spawnPreviewUnit setVariable ["BIS_fnc_animalBehaviour_disable", true];
	_spawnPreviewUnit disableAI "ANIM";
	_spawnPreviewUnit disableAI "MOVE";
	_spawnPreviewUnit disableAI "FSM";
	_spawnPreviewUnit disableAI "AUTOTARGET";
	_spawnPreviewUnit disableAI "TARGET";
	_spawnPreviewUnit disableAI "CHECKVISIBLE";
	_spawnPreviewUnit allowDamage false;
	_spawnPreviewUnit removeAllEventHandlers "HandleDamage";
	if !(_selectClassUnit) then
	{
		_headgear = _playerData select 23;
		_goggles = _playerData select 20;
		_primaryWeapon = _playerData select 26;
		_secondaryWeapon = _playerData select 28;
		_handgunWeapon = _playerData select 22;
		_primaryWeaponItems = _playerData select 27;
		_secondaryWeaponItems = _playerData select 29;	
		_handgunWeaponItems = _playerData select 21;
		_weaponItems = _playerData select 25;
		_uniform = _playerData select 30;
		_vest = _playerData select 34;
		_backpack = _playerData select 15;
		_currentWeapon = _playerData select 19;
	}
	else
	{
		_class = _this select 2;
		_config = missionConfigFile >> "CfgPlayer" >> "CfgExileLifeClasses" >> _class;
		_headgear = getText(_config >> "Outfit" >> "headgear");
		_goggles = getText(_config >> "Outfit" >> "goggles");
		_primaryWeapon = getText(_config >> "Outfit" >> "primaryWeapon");
		_secondaryWeapon = getText(_config >> "Outfit" >> "secondaryWeapon");
		_handgunWeapon = getText(_config >> "Outfit" >> "handgunWeapon");
		_primaryWeaponItems = getArray(_config >> "Outfit" >> "primaryWeaponItems");
		_secondaryWeaponItems = getArray(_config >> "Outfit" >> "secondaryWeaponItems");		
		_handgunWeaponItems = getArray(_config >> "Outfit" >> "handgunWeaponItems");
		_weaponItems = getArray(_config >> "Outfit" >> "weaponItems");
		_uniform = getText(_config >> "Outfit" >> "uniform");
		_vest = getText(_config >> "Outfit" >> "vest");
		_backpack = getText(_config >> "Outfit" >> "backpack");
		_currentWeapon = getText(_config >> "Outfit" >> "currentWeapon");
	};
	if !(_headgear isEqualto "") then
	{
		_spawnPreviewUnit addHeadgear _headgear;
	}
	else
	{
		removeHeadgear _spawnPreviewUnit; 
	};
	if !(_goggles isEqualto "") then
	{
		_spawnPreviewUnit addGoggles _goggles;
	}
	else
	{
		removeGoggles _spawnPreviewUnit; 
	};
	if !(_primaryWeapon isEqualto "") then
	{
		_spawnPreviewUnit addWeaponGlobal _primaryWeapon;
		removeAllPrimaryWeaponItems _spawnPreviewUnit;
		{
			if (_x isEqualto "") then
			{
				_spawnPreviewUnit addPrimaryWeaponItem _x;
			};
		}
		forEach _primaryWeaponItems;
	};
	if (_secondaryWeapon != "") then
	{
		_spawnPreviewUnit addWeaponGlobal _secondaryWeapon;
		{
			if (_x != "") then
			{
				_spawnPreviewUnit addSecondaryWeaponItem _x;
			};
		}
		forEach _secondaryWeaponItems;
	};
	if !(_handgunWeapon isEqualto "") then
	{
		_spawnPreviewUnit addWeaponGlobal _handgunWeapon;
		removeAllHandgunItems _spawnPreviewUnit;
		{
			if (_x isEqualto "") then
			{
				_spawnPreviewUnit addHandgunItem _x;
			};
		}
		forEach _handgunWeaponItems;
	};
	if !(_currentWeapon isEqualto "") then
	{
		_spawnPreviewUnit selectWeapon _currentWeapon;
	};
	{
		_spawnPreviewUnit addWeaponItem [_x select 0, [_x select 1, _x select 2, _x select 3]];
	}
	forEach _weaponItems;
	if !(_uniform isEqualto "") then
	{
		_spawnPreviewUnit forceAddUniform _uniform;
	};
	if !(_vest isEqualto "") then
	{
		_spawnPreviewUnit addVest _vest;
	};
	if !(_backpack isEqualto "") then
	{
		_spawnPreviewUnit addBackpackGlobal _backpack;
	};
	if !(_primaryWeapon isEqualto "") then
	{
		_weapon = _primaryWeapon;
	}
	else
	{
		if !(_secondaryWeapon isEqualto "") then
		{
			_weapon = _secondaryWeapon;
		}
		else
		{
			if !(_handgunWeapon isEqualto "") then
			{
				_weapon = _handgunWeapon;
			}
			else
			{
				_weapon = "";
			};
		};
	};
	if !(_weapon isEqualto "") then
	{
		_spawnPreviewUnit selectWeapon _weapon;
	};
	if !(_primaryWeapon isEqualto "") then
	{
		_spawnPreviewUnit setVariable ["ExileLifeClientBambi", false];
		_animations = ["HubStanding_idle1", "HubStanding_idle2", "HubStanding_idle3"] call BIS_fnc_arrayShuffle;
		_spawnPreviewUnit switchMove (_animations select 0);
		_spawnPreviewUnit setVariable ["ExileAnimations", _animations];
		_spawnPreviewUnit addEventHandler	["AnimDone", {_this call ExileClient_object_trader_event_onAnimationDone}];
	}
	else
	{
		_spawnPreviewUnit setVariable ["ExileLifeClientBambi", false];
		_animations = ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"] call BIS_fnc_arrayShuffle;
		_spawnPreviewUnit switchMove (_animations select 0);
		_spawnPreviewUnit setVariable ["ExileAnimations", _animations];
		_spawnPreviewUnit addEventHandler	["AnimDone", {_this call ExileClient_object_trader_event_onAnimationDone}];
	};
};
_spawnPreviewUnit setposATL _UnitPosition;
_spawnPreviewUnit
