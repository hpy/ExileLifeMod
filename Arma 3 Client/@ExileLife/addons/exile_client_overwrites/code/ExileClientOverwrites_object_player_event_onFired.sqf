/**
                    * ExileClientOverwrites_object_player_event_onFired
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

                    private["_unit","_weapon","_muzzle","_mode","_ammo","_magazine","_projectile","_nocombat","_melee","_config","_primaryAnimation","_animationType","_animation","_secondaryAnimation","_disableShiftAnimation","_delayStart","_delayFinish","_swingMemoryPoints","_weaponPositions","_primaryScript","_secondaryScript","_executeCode","_code","_object","_intersection","_firstInsection","_sound","_anim"];
_unit = _this select 0;
_weapon = _this select 1;
_muzzle = _this select 2;
_mode =	_this select 3;
_ammo = _this select 4;
_magazine =	_this select 5;
_projectile = _this select 6;
_nocombat = false;
_melee = false;
if (ExileLifeMeleeInProgress) exitWith
{
	if (local _projectile) then
	{
		deleteVehicle _projectile;
	};
};
_config = (configFile >> "CfgWeapons" >> _weapon);
if (isClass (_config >> "Melee")) then {_melee = true;};
if (_melee) exitWith
{
	if (local _projectile) then
	{
		deleteVehicle _projectile;
	};
	_primaryAnimation = getArray(_config >> "melee" >> "primaryAnimation");
	_animationType =  _primaryAnimation select 0; 
	_animation = _primaryAnimation select 1;
	_secondaryAnimation = getArray(_config >> "melee" >> "secondaryAnimation");
	_disableShiftAnimation = getNumber(_config >> "melee" >> "disableShiftAnimation");
	_delayStart = getNumber(_config >> "melee" >> "swingTimeHitStart");
	_delayFinish = getNumber(_config >> "melee" >> "swingTimeHitFinish");
	_swingMemoryPoints = getArray(_config >> "melee" >> "swingMemoryPoints");
	_ammo = getText(_config >> "melee" >> "ammo");
	_weaponPositions = getArray(_config >> "melee" >> "weaponPositions");
	_primaryScript = getText(_config >> "melee" >> "executePrimary");	
	_secondaryScript = getText(_config >> "melee" >> "executeSecondary");	
	_executeCode = _primaryScript;
	if (ExileLifeShiftState) then
	{
		if (_disableShiftAnimation == 1) then
		{
			_animationType = "";
			_animation = "";
		}
		else
		{
			if !(_secondaryAnimation isEqualTo []) then
			{
				_animationType =  _secondaryAnimation select 0;
				_animation = _secondaryAnimation select 1;
			};
		};
		if !(_secondaryScript isEqualTo "") then
		{
			_executeCode = _secondaryScript;
		};
	};
	if !(_executeCode isEqualTo "") then
	{
		_code = missionNamespace getVariable [_executeCode,""];
		if !(_code isEqualTo "") then
		{
			call _code;
		};
	};
	if !(_animationType isEqualTo "") then
	{
		switch (_animationType) do
		{
			case "switchMove" : 	{  ["switchMoveRequest", [netId player, _animation]] call ExileClient_system_network_send;};
			case "playMoveNow" : 	{  player playMoveNow _animation; };
			case "playActionNow" : 	{ player playActionNow _animation; };
			default {};
		};
	};
	ExileLifeMeleeInProgress = true;
	[_delayStart,_delayFinish,_ammo,_weaponPositions,_swingMemoryPoints] spawn ExileLifeClient_object_player_action_melee;
};
switch (_weapon) do
{
	case "Put":
	{
		if (_magazine in ["DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag"]) then
		{
			_object = cursorTarget;
			if ((_object isKindOf "LandVehicle") || (_object isKindOf "Air") || (_object isKindOf "Boat") || (_object isKindOf "Man") || (_object isKindOf "Exile_Construction_Abstract_Static")) then
			{
				_intersection = lineIntersectsSurfaces
				[
					AGLToASL positionCameraToWorld [0, 0, 0],
					AGLToASL positionCameraToWorld [0, 0, 5],
					player,
					objNull,
					true,
					1,
					"VIEW",
					"GEOM"
				];
				if (count _intersection > 0) then
				{
					_firstInsection = _intersection select 0;
					if !(simulationEnabled _object) then
					{
						if (local _object) then
						{
							_object enableSimulation true;
						}
						else
						{
							["enableSimulationRequest", [netId _object]] call ExileClient_system_network_send;
						};
					};
					_projectile setPosASL [0, 0, 0];
					_projectile attachTo [_object, _object worldToModel (ASLtoAGL (_firstInsection select 0)) ];
					_projectile setVectorUp (_firstInsection select 1);
				};
			};
		};
	};
	case "Throw":
	{
		switch (_magazine) do
		{
			case "Exile_Item_ZipTie":
			{
				call ExileClient_object_handcuffs_use;
				if (local _projectile) then
				{
					deleteVehicle _projectile;
				};
			};
		};
	};
	default
	{
		if !(_nocombat) then
		{
			ExileClientPlayerIsInCombat = true;
			ExileClientPlayerLastCombatAt = diag_tickTime;
			true call ExileClient_gui_hud_toggleCombatIcon;
			if !(isNull _projectile) then
			{
				if (isClass (configFile >> "CfgWeapons" >> _weapon >> "Eventhandler" >> "Fired")) then
				{
					if ((player ammo _weapon) isEqualTo 0) exitWith {};
					ExileLifeBoltingThread =
					[
						0.001,
						{
							_weapon = _this select 0;
							_muzzle = _this select 1;
							if ((currentMuzzle player) isEqualTo _muzzle) then
							{
								if ((inputAction "DefaultAction") isEqualTo 0) then
								{
									[ExileLifeBoltingThread] call ExileClient_system_thread_removeTask;
									_sound = getArray (configFile >> "cfgWeapons" >> _weapon >> "EventHandler" >> "Fired" >> "boltSound");
									_anim = getText (configFile >> "cfgWeapons" >> _weapon >> "EventHandler" >> "Fired" >> "boltAnim");
									if !(_sound isEqualTo []) then
									{
										playSound3D [_sound select 0, player, false, ATLToASL ( player modelToWorldVisual (player selectionPosition "RightHandMiddle1")),_sound select 1,_sound select 2,_sound select 3];
									};
									if !(_anim isEqualTo "") then
									{
										player playAction _anim;
									};
								};
								player setWeaponReloadingTime [player, _muzzle, 1];
							}
							else
							{
								[ExileLifeBoltingThread] call ExileClient_system_thread_removeTask;
							};
						},
						[_weapon,_muzzle],
						true
					]
					call ExileClient_system_thread_addTask;
				};
				[_weapon, _ammo] call ExileLifeClient_object_player_event_handleHearingLoss;
				_this call ExileLifeClient_object_player_event_handleWeaponChances;
				if !(isNull _projectile) then 
				{
					if (cameraView isEqualTo "GUNNER") then 
					{
						if (isNumber (configFile >> "CfgMagazines" >> _magazine >> "exileBulletCam")) then 
						{
							call ExileClient_system_bulletCam_destroy;
							ExileClientBulletCameraThread = _projectile spawn ExileClient_system_bulletCam_thread;
						};
					};
				};
				_ammo call ExileLifeClient_object_player_event_handleBulletCollection;
			};
		};
	};
};
true