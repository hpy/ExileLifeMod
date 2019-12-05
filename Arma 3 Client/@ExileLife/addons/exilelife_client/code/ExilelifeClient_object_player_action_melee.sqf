/**
                    * ExilelifeClient_object_player_action_melee
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_delayStart","_delayFinish","_ammo","_weaponPositions","_swingMemoryPoints","_debug","_weaponPositionStart","_weaponPositionEnd","_damage","_timeDelayStart","_timeDelayFinish","_result","_playerChk","_vehicleChk","_timeDelay","_weapon","_head","_weaponStartCorrection","_weaponStart","_weaponEndCorrection","_weaponEnd","_intersect","_object","_hitPoint","_intersectObject","_hitPoints","_hitpoints","_tempHitPoint","_closestDistance","_selectionPos","_selectionPosASL","_tempDistance","_currentDamage","_newDamage"];
if !(ExileLifeMeleeInProgress) exitWith {ExileLifeMeleeStart = false;};
_delayStart = _this select 0;
_delayFinish = _this select 1;
_ammo = _this select 2;
_weaponPositions = _this select 3;
_swingMemoryPoints = _this select 4;
_debug = false; 
_weaponPositionStart = _weaponPositions select 0; 
_weaponPositionEnd = _weaponPositions select 1;	
_damage = getNumber (configFile >> "cfgAmmo" >> _ammo >> "hit");
_timeDelayStart = time + _delayStart;
_timeDelayFinish = time + _delayFinish;
_result = false;
_playerChk = false;
_vehicleChk = false;
if (_debug) then
{
	systemchat "starting melee";
	diag_log format  ["melee attack inputs: %1",_this];	
};
if (_ammo == "ExileLife_Ammo_Fist") then
{
	while {((ExileLifeMeleeInProgress) || (_timeDelay < time))} do
	{
	};
}
else
{
	_weapon = player selectionPosition (_swingMemoryPoints select 1);
	_head = player selectionPosition (_swingMemoryPoints select 0);
	uisleep _delayStart;
	if (_debug) then
	{
		arrow1 = "Exile_Cosmetic_BBQSandwich" createVehicle [0,0,0];
		arrow2 = "Exile_Cosmetic_BBQSandwich" createVehicle [0,0,0];
	};
	while {((ExileLifeMeleeInProgress) || (_timeDelayFinish < time))} do
	{
		_weaponStartCorrection = [0,0,((_head select 2) - (_weapon select 2))];
		_weaponStart = AGLToASL (player modelToWorld (_weaponPositionStart vectorAdd _weaponStartCorrection) );
		_weaponEndCorrection = [0,0,((_head select 2) - (_weapon select 2))];
		_weaponEnd = AGLToASL (player modelToWorld (_weaponPositionEnd vectorAdd _weaponEndCorrection));
		if (_debug) then
		{
			arrow1 setposasl _weaponStart;
			arrow2 setposasl _weaponEnd;
		};
		_intersect = lineIntersectsSurfaces [_weaponStart, _weaponEnd, player, objNull, false, 1, "GEOM", "VIEW"];
		if !(_intersect isEqualTo []) then
		{
			_object = (_intersect select 0) select 2;
			_hitPoint = (_intersect select 0) select 0; 
			if (alive _object) then
			{
				if (_object == player) exitWith
				{
					diag_log "stop hitting yourself";
				};
				_intersectObject = ((_intersect select 0) select 2);
				switch (typeof _intersectObject) do
				{
					case "Exile_Unit_Player" : {  _playerChk = true; };
					case "ExileLife_Unit_Guard" : {  _playerChk = true; };
					default { _vehicleChk = true; }; 
				};
				if (_vehicleChk) then
				{
					_hitPoints = [];
					try
					{
						if (_intersectObject isKindof "landVehicle") then
						{
							throw []; 
						};
						if (_intersectObject isKindof "Air") then
						{
							throw []; 
						};
						if (_intersectObject isKindof "Boat") then
						{
							throw [];	
						};												
					}
					catch
					{
						_hitpoints = _exception;
					};
				}; 
			}
			else
			{
			};
			if (_playerChk) then
			{
				_result = true;
				_tempHitPoint = "";
				_closestDistance = 10;
				{
					_selectionPos = _object selectionPosition [(_x select 1), "HitPoints"];
					_selectionPosASL = AGLToASL (_object modelToWorld _selectionPos);
					_tempDistance = (_selectionPosASL vectorDistance _hitPoint);
					if (_debug) then
					{
						systemchat format [ "melee _object %1 :  _hitPoint %2 :  _selectionPos %3 --- _tempDistance %4",_object,_hitPoint,_selectionPos,_tempDistance];
						diag_log format [ "melee _object %1 :  _hitPoint %2 :  _selectionPos %3 --- _tempDistance %4",_object,_hitPoint,_selectionPos,_tempDistance];
					};
					if (_tempDistance < _closestDistance) then
					{
						_tempHitPoint = _x select 0;
						_closestDistance = _tempDistance;
					};
				}forEach [
							["HitBody","body"],
							["HitArms","arms"],
							["HitLegs","legs"],
							["HitHead","head"]
						];
			};
			if (_result) then
			{
				if !(_tempHitPoint isEqualTo "") then
				{
					if (local _object) then
					{
						_currentDamage = _object getHitPointDamage _tempHitPoint;
						_newDamage = _currentDamage + (_damage / 10); 
						_object setHitPointDamage [_tempHitPoint, _newDamage];
					}
					else
					{
						["meleeRequest",[netID _object,_ammo,_tempHitPoint]] call ExileClient_system_network_send;
					};
					if ((floor(random 10)) <= 2) then 
					{
						["Strength",20] call ExileLifeClient_object_player_skills_updateSkillRequest;
					};
					ExileClientPlayerIsInCombat = true;
					ExileClientPlayerLastCombatAt = diag_tickTime;
					true call ExileClient_gui_hud_toggleCombatIcon;
				};
			};
		};
		if ((_playerChk) || (_timeDelayFinish < time)) exitWith
		{
			ExileLifeMeleeInProgress = false;
			if (_debug) then
			{
				deletevehicle arrow1;
				deletevehicle arrow2;
			};
		};
		uisleep 0.02;
	};
};
