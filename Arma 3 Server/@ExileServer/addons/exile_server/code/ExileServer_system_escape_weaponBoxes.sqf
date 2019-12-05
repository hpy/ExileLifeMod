/**
                    * ExileServer_system_escape_weaponBoxes
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

                    private["_numberOfBoxes","_centerOfPlay","_areaOfPlay","_spawnPositions","_i","_position","_weaponBox","_weaponArray","_weapon","_ammoList","_ammo","_medicalArray","_medical","_opticArray","_optic"];
"Spawning weapon boxes." call ExileServer_util_log;
_numberOfBoxes = getNumber (configFile >> "CfgSettings" >> "Escape" >> "numberOfBoxes");
_centerOfPlay = getMarkerPos "ExileFuturePlayArea";
_areaOfPlay = (getMarkerSize "ExileFuturePlayArea") select 0;
_spawnPositions = [_centerOfPlay, _areaOfPlay, _numberOfBoxes, 250] call ExileServer_system_escape_findSafePositions;
for "_i" from 0 to _numberOfBoxes - 1 do 
{
	_position = _spawnPositions select _i;
	_weaponBox = createVehicle ["Box_IND_WpsSpecial_F", _position, [], 0, "CAN_COLLIDE"];
	_weaponBox setDir (random 360);
	_weaponBox allowDamage false;
	clearMagazineCargoGlobal _weaponBox;
	clearBackpackCargoGlobal _weaponBox;
	clearWeaponCargoGlobal _weaponBox;
	clearItemCargoGlobal _weaponBox;		
	_weaponArray = missionNamespace getVariable ["ExileCachedLootItemGroupNiceWeapons", []];
	_weapon = selectRandom _weaponArray;
	_weaponBox addWeaponCargoGlobal [_weapon, 1];
	_ammoList = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines");
	if (count _ammoList > 0) then
	{
		_ammo = _ammoList select 0;
		_weaponBox addItemCargoGlobal [_ammo, (2 + floor(random 5))];
	};
	_medicalArray = missionNamespace getVariable ["ExileCachedLootItemGroupNiceMedical", []];
	_medical = selectRandom _medicalArray;
	_weaponBox addItemCargoGlobal [_medical, 1];
	_opticArray = missionNamespace getVariable ["ExileCachedLootItemGroupNiceScopes", []];
	_optic = selectRandom _opticArray;
	_weaponBox addItemCargoGlobal [_optic, 1];
};
true