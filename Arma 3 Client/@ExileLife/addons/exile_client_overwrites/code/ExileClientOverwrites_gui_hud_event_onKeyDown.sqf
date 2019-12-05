/**
                    * ExileClientOverwrites_gui_hud_event_onKeyDown
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

                    private["_caller","_keyCode","_shiftState","_controlState","_altState","_weapon","_stopPropagation","_grenadeName","_height","_vel","_dir","_speed","_max","_weaponAmmo","_hashArray","_code","_key","_events"];
_caller = _this select 0;
_keyCode = _this select 1;
_shiftState = _this select 2;
_controlState = _this select 3;
_altState = _this select 4;
if (str(_keyCode) in ExileLifeForbiddenStringedDiks) exitwith {};
if ((player getVariable ['ExileLifeClientIncapacitated', false]) || (!alive player)) exitWith{};
_weapon = (currentWeapon player);
if (_shiftState) then
{
	ExileLifeShiftState = true;
};
if ((_keyCode in (actionKeys "nightVision")) && ExileClientGasMaskVisible) exitWith {true};
if (_keyCode in (actionKeys "TacticalView")) exitWith {true};
if (!(_controlState) && (_keyCode in (actionKeys "Throw"))) exitWith
{
	_stopPropagation = false;
	_grenadeName = (currentThrowable player) select 0;
	if (_grenadeName isEqualTo "Exile_Item_ZipTie") then
	{
		call ExileClient_object_handcuffs_use;
		_stopPropagation = true;
	};
	_stopPropagation
};
if (_keyCode in (actionKeys 'GetOver')) then
{
	if (_shiftState) then
	{
		if ((speed player) > 4) then
		{
			if !(ExileLifeJumpInProgress) then
			{
				if (isTouchingGround player) then
				{
					if !((currentWeapon player) isEqualTo "") then
					{
						if !((animationState player) in ['aovrpercmrunsraswrfldf']) then
						{
							ExileLifeJumpInProgress = true;
							_height = 6 - ((load player) * 10);
							_vel = velocity player;
							_dir = getDir player;
							_speed = 0.4;
							_max_height = 4;
							if (_height > _max_height) then
							{
								_height = _max_height
							};
							player setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+(cos _dir*_speed),((_vel select 2)+_height)];
							["switchMoveRequest",[netID player,'AovrPercMrunSrasWrflDf']] call ExileClient_system_network_send;
							[0.5,{ExileLifeJumpInProgress = false},[],false,"Jump Reset"] call ExileClient_system_thread_addTask;
							_stopPropagation = true;
						};
					};
				};
			};
		};
	};
};
if (!(_controlState) && (_keyCode in (actionKeys "ReloadMagazine"))) exitWith 
{
	_stopPropagation = false;
	if !(_weapon isEqualTo "") then 
	{
		if (_weapon in [ExileLifePrimaryWeaponJammed, ExileLifeHandgunWeaponJammed]) then 
		{
			["ErrorTitleAndText", ["Weapon jammed!", "Use Ctrl-R to clear the jam!"]] call ExileClient_gui_toaster_addTemplateToast;
			_stopPropagation =  true;	
		};
	};
	_stopPropagation
};
switch (_keyCode) do
{
	case 0x29:	{ _stopPropagation = true; }; 
	case 0x0B:	 	{ _stopPropagation = true; };
	case 0x06: 	{ _stopPropagation = true; };
	case 0x07: 	{ _stopPropagation = true; };
	case 0x08: 	{ _stopPropagation = true; };
	case 0x09: 	{ _stopPropagation = true; };
	case 0x0A: 	{ _stopPropagation = true; };
	case 0x3B: 	{ _stopPropagation = true; };
	case 0x3C: 	{ _stopPropagation = true; };
	case 0x3D:	{ _stopPropagation = true; };
	case 0x3E:	{ _stopPropagation = true; };
	case 0x3F:	{ _stopPropagation = true; };
	case 0x40: 	{ _stopPropagation = true; };
	case 0x41: 	{ _stopPropagation = true; };
	case 0x42:	{ _stopPropagation = true; };
	case 0x43: 	{ _stopPropagation = true; };
	case 0x44:	{ _stopPropagation = true; };
	case 0x57: 	{ _stopPropagation = true; };
	case 0x58: 	{ _stopPropagation = true; };
	case 0x0E: 	{ _stopPropagation = true; };
	case 0xCF:	{ _stopPropagation = true; };
	case 0xC7:	{ _stopPropagation = true; };
	case 0x02:
	{
		_stopPropagation = true;
	};
	case 0x03:
	{
		_stopPropagation = true;
	};
	case 0x04:
	{
		_stopPropagation = true;
	};
	case 0x05:
	{
		_stopPropagation = true;
	};
	case 0xD2:
	{
		_stopPropagation = true;
	};
	case 0x10:
	{
		if (ExileClientIsInConstructionMode) then
		{
			_stopPropagation = true;
		};
	};
	case 0x12:
	{
		if (ExileClientIsInConstructionMode) then
		{
			_stopPropagation = true;
		};
	};
	case 0xC9: 
	{
		if (ExileClientIsInConstructionMode) then
		{
			_stopPropagation = true;
		};
	};
	case 0xD1: 
	{
		if (ExileClientIsInConstructionMode) then
		{
			_stopPropagation = true;
		};
	};
	case 0x39:
	{
		if (ExileClientIsInConstructionMode) then
		{
			_stopPropagation = true;
		};
	};
	case 0x01:
	{
		if (ExileClientIsInConstructionMode) then
		{
			ExileClientConstructionResult = 2;
			_stopPropagation = true;
		};
		if (ExileIsPlayingRussianRoulette) then
		{
			if (ExileRussianRouletteCanEscape) then
			{
				["leaveRussianRouletteRequest", []] call ExileClient_system_network_send;
				ExileRussianRouletteCanEscape = false;
			};
			_stopPropagation = true;
		};
	};
	case 0x13:
	{
		if (_controlState) then 
		{
			if (_weapon in [ExileLifePrimaryWeaponJammed, ExileLifeHandgunWeaponJammed]) then 
			{
				[missionNamespace getVariable [format["ExileLife_Thread_JammedWeapon_%1", _weapon], -1]] call ExileClient_system_thread_removeTask;
				switch (currentWeapon player) do
				{
					case (primaryWeapon player):
					{
						ExileLifePrimaryWeaponJammed = "";
					};
					case (handGunWeapon player):
					{
						ExileLifeHandgunWeaponJammed = "";
					};
				};
				_weaponAmmo = missionNamespace getVariable [format["ExileLife_Thread_JammedWeapon_AmmoCount_%1", _weapon], 0];
				if (_weaponAmmo > 0) then 
				{
					player playAction (getText(configFile >> "CfgWeapons" >> _weapon >> "reloadAction"));	
					player setAmmo 
					[
						_weapon,
						missionNamespace getVariable [format["ExileLife_Thread_JammedWeapon_AmmoCount_%1", _weapon], 0]
					];
				}
				else
				{
					reload player;
					call ExileLifeClient_object_player_event_handleReload;
				};
				missionNamespace setVariable [format["ExileLife_Thread_JammedWeapon_AmmoCount_%1", _weapon], nil];
				missionNamespace setVariable [format["ExileLife_Thread_JammedWeapon_%1", _weapon], nil];
				_stopPropagation = true;
			};
		};
	};
};
if !(ExileLifeActiveKeyDown isEqualTo []) then
{
	{
		_hashArray = ExileLifeKeybindsDown getVariable _x;
		if !(isNil "_hashArray") then
		{
			_code = _hashArray select 0;
			_key = (_hashArray select 1) select 0;
			if (_key isEqualTo _keyCode) then
			{
				_events = (_hashArray select 1) select 1;
				if
				(
					_shiftState isEqualTo (_events select 0)
					&&
					_controlState isEqualTo (_events select 1)
					&&
					_altState isEqualTo (_events select 2)
				) then
				{
					_stopPropagation = call _code;
				};
			};
		}
		else
		{
			format["Keybind %1 does not exist!",_x] call ExileLifeClient_util_log;
		};
	}
	forEach ExileLifeActiveKeyDown;
};
((!isNil "_stopPropagation") || _stopPropagation isEqualTo true)
