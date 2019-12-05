/**
                    * ExileClientOverwrites_gui_hud_renderWeaponPanel
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

                    private["_display","_weaponPanelControl","_weaponPanelType","_currentTurretPath","_vehicle","_vehicleRole","_currentZeroing","_currentWeaponState","_currentWeaponClassName","_currentFireMode","_currentMagazineClassName","_currentAmmoCount","_compatibleMagazines","_currentMagazineCount","_needReload","_currentMuzzle","_ammoColor","_ammoControl","_magazineControl","_zeroingControl","_fireModeControl","_muzzleDisplayName","_muzzleControl"];
disableSerialization;
_display = uiNamespace getVariable "RscExileHUD";
_weaponPanelControl = _display displayCtrl 1100;
_weaponPanelType = 0;
_currentTurretPath = [];
_vehicle = vehicle player;
if !(_vehicle isEqualTo player) then
{
	if !(_vehicle isKindOf "ParachuteBase") then 
	{
		_vehicleRole = assignedVehicleRole player;
		switch (toLower (_vehicleRole select 0)) do
		{
			case "driver": 
			{
				_weaponPanelType = 0;
				_currentTurretPath = [-1];
			};
			case "cargo":
			{
				if !((count _vehicleRole) isEqualTo 1) then
				{
					if !((currentWeapon player) isEqualTo "") then
					{
							_weaponPanelType = 1;
					};
				};
			};
			case "turret":
			{
				_weaponPanelType = 2; 
				_currentTurretPath = _vehicleRole select 1;
			};
		};
	};
}
else
{
	if !((currentWeapon player) isEqualTo "") then
	{
			_weaponPanelType = 1; 
		if ((binocular player) isEqualTo (currentWeapon player)) then
		{
			_weaponPanelType = 0;
		};
		if ((currentWeapon player) isKindOf ["Exile_Melee_Abstract", configFile >> "CfgWeapons"]) then
		{
			_weaponPanelType = 0;
		};
	};
};
if (_weaponPanelType isEqualTo 0) then
{
	if (ctrlShown _weaponPanelControl) then
	{
		_weaponPanelControl ctrlShow false;
	};
}
else
{
	if !(ctrlShown _weaponPanelControl) then
	{
		_weaponPanelControl ctrlShow true;
	};
	switch (_weaponPanelType) do
	{
		case 2:
		{
			_currentZeroing = currentZeroing player;
			_currentWeaponState = weaponState [_vehicle, _currentTurretPath];
			_currentWeaponClassName = _currentWeaponState select 0;
			_currentFireMode = _currentWeaponState select 2;
			_currentMagazineClassName = _currentWeaponState select 3;
			_currentAmmoCount = _currentWeaponState select 4;
			_compatibleMagazines = getArray (configFile >> "CfgWeapons" >> _currentWeaponClassName >> "magazines");
			_currentMagazineCount =
			{
				((_x select 1) isEqualTo _currentTurretPath) && {(_x select 2) > 0} && {(_x select 0) in _compatibleMagazines}			
			} count (magazinesAllTurrets _vehicle);
			_currentMagazineCount = (_currentMagazineCount - 1) max 0;
			_needReload = needReload _vehicle; 
		};
		case 1:
		{
			_currentZeroing = currentZeroing player;
			_currentWeaponState = weaponState player;
			_currentWeaponClassName = _currentWeaponState select 0;
			_currentMuzzle = _currentWeaponState select 1;
			_currentFireMode = _currentWeaponState select 2;
			_currentMagazineClassName = _currentWeaponState select 3;
			_currentAmmoCount = _currentWeaponState select 4;
			if (isArray (configFile >> "CfgWeapons" >> _currentWeaponClassName >> _currentMuzzle >> "magazines") ) then
			{
				_compatibleMagazines = getArray (configFile >> "CfgWeapons" >> _currentWeaponClassName >> _currentMuzzle >> "magazines");
			}
			else
			{
				_compatibleMagazines = getArray (configFile >> "CfgWeapons" >> _currentWeaponClassName >> "magazines");
			};
			_compatibleMagazines = _compatibleMagazines call ExileClient_util_array_toLower;
			_needReload = [_currentMagazineClassName, _currentAmmoCount] call ExileClient_util_gear_needReload;
			_currentMagazineCount =	{(toLower _x) in _compatibleMagazines} count (magazines player);
		};
	};
	_ammoColor = if ((_needReload >= 0.7) || (_currentAmmoCount isEqualTo 0)) then { [221/255, 38/255, 38/255, 1] } else { [1, 1, 1, 1] };
	_ammoControl = _display displayCtrl 1102;
	_ammoControl ctrlSetTextColor _ammoColor;
	_ammoControl ctrlSetText (str _currentAmmoCount);			
	_magazineControl = _display displayCtrl 1104;
	_magazineControl ctrlSetText (str _currentMagazineCount);
	_zeroingControl = _display displayCtrl 1105;
	if (_currentZeroing > 999) then
	{
		_zeroingControl ctrlSetText (format ["%1km", _currentZeroing / 1000]);
	}
	else
	{
		_zeroingControl ctrlSetText (format ["%1m", _currentZeroing]);
	};
	_fireModeControl = _display displayCtrl 1103;
	switch (_currentFireMode) do
	{
		case "Single": 		{ _fireModeControl ctrlSetText "SEMI"; };
		case "Burst":   	{ _fireModeControl ctrlSetText "BURST"; };
		case "Burst2rnd": 	{ _fireModeControl ctrlSetText "BURST"; };
		default  			{ _fireModeControl ctrlSetText "AUTO"; };
	};
	if !(_currentMagazineClassName isEqualTo ExileHudLastRenderedMuzzle) then
	{
		_muzzleDisplayName = getText(configFile >> "CfgMagazines" >> _currentMagazineClassName >> "displayName");
		if !(_muzzleDisplayName isEqualTo "") then
		{
			_muzzleControl = _display displayCtrl 1005;
			_muzzleControl ctrlSetText _muzzleDisplayName;
			_muzzleControl ctrlSetFade 0;
			_muzzleControl ctrlCommit 0;
			_muzzleControl ctrlSetFade 1;
			_muzzleControl ctrlCommit 3;
		};
		ExileHudLastRenderedMuzzle = _currentMagazineClassName;
	};
};
