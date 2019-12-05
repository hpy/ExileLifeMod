/**
                    * ExileClientOverwrites_util_playerCargo_takeAll
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

                    private["_target","_player","_targetUniformContent","_targetVestContent","_targetBackpackContent","_serializedCargo","_subContainerClassName","_subContainerCargo","_subContainerItemInformation","_canAddSubContainer","_newSubContainerHandle","_weaponItems","_itemClassName","_magazineClassName","_magazineBulletCount","_itemQuantity","_newQuantity","_magazinesToStayInContainer"];
_target = _this select 0;
_player = _this select 1;
if (_target isKindOf "Man") then
{
	if ((uniform _player) isEqualTo "") then
	{
		if !((uniform _target) isEqualTo "") then
		{
			_targetUniformContent = (uniformContainer _target) call ExileClient_util_containerCargo_serialize;
			_player forceAddUniform (uniform _target);
			[(uniformContainer _player), _targetUniformContent] call ExileClient_util_containerCargo_deserialize;
			removeUniform _target; 
		};
	};
	if ((vest _player) isEqualTo "") then
	{
		if !((vest _target) isEqualTo "") then
		{
			_targetVestContent = (vestContainer _target) call ExileClient_util_containerCargo_serialize;
			_player addVest (vest _target);
			[(vestContainer _player), _targetVestContent] call ExileClient_util_containerCargo_deserialize;
			removeVest _target; 
		};
	};
	if ((backpack _player) isEqualTo "") then
	{
		if !((backpack _target) isEqualTo "") then
		{
			_targetBackpackContent = (backpackContainer _target) call ExileClient_util_containerCargo_serialize;
			_player addBackpackGlobal (backpack _target);
			[(backpackContainer _player), _targetBackpackContent] call ExileClient_util_containerCargo_deserialize;
			removeBackpackGlobal _target; 
		};
	};
	if !((headgear _target) isEqualTo "") then
	{
		if ([_player, (headgear _target)] call ExileClient_util_playerCargo_add) then
		{
			removeHeadgear _target; 
		};
	};
	if !((goggles _target) isEqualTo "") then
	{
		if ([_player, (goggles _target)] call ExileClient_util_playerCargo_add) then
		{
			removeGoggles _target; 
		};
	};
	if !((binocular _target) isEqualTo "") then
	{
		if ([_player, (binocular _target)] call ExileClient_util_playerCargo_add) then
		{
			_target removeWeaponGlobal (binocular _target); 
		};
	};
	{
		if !(_x isEqualTo "") then
		{
			if (_x in ["NVGoggles","NVGoggles_OPFOR","NVGoggles_INDEP","O_NVGoggles_hex_F","O_NVGoggles_urb_F","O_NVGoggles_ghex_F","NVGoggles_tna_F","NVGogglesB_blk_F","NVGogglesB_grn_F","NVGogglesB_gry_F"]) then
			{
				if (_player getVariable ["ExileLifeClient:Guard",false]) then
    			{
					if ([_player, _x] call ExileClient_util_playerCargo_add) then
					{
						_target unlinkItem _x; 
					};
				}
				else
				{
					_target unlinkItem _x; 
				};
			}
			else
			{
				if ([_player, _x] call ExileClient_util_playerCargo_add) then
				{
					_target unlinkItem _x; 
				};
			};
		};
	}
	forEach (assigneditems _target);
	["takeMoneyRequest", [netId _target, 0]] call ExileClient_system_network_send;
}
else
{
	_serializedCargo = _target call ExileClient_util_containerCargo_serialize;
	{
		_subContainerClassName = _x select 0;
		_subContainerCargo = _x select 1;
		_subContainerItemInformation = [_subContainerClassName] call BIS_fnc_itemType;
		_canAddSubContainer = true;
		switch (_subContainerItemInformation select 1) do
		{
			case "Backpack":	{ _canAddSubContainer = ((backpack _player) isEqualTo ""); };
			case "Uniform":		{ _canAddSubContainer = ((uniform _player) isEqualTo ""); };
			case "Vest": 		{ _canAddSubContainer = ((vest _player) isEqualTo ""); };
		};
		if (_canAddSubContainer) then
		{
			[_player, _subContainerClassName] call ExileClient_util_playerEquipment_add;
			_newSubContainerHandle = objNull;
			{
				if ((_x select 0) isEqualTo _subContainerClassName) exitWith
				{
					_newSubContainerHandle = _x select 1;
				};
			}
			forEach
			[
				[uniform _player, uniformContainer _player],
				[vest _player, vestContainer _player],
				[backpack _player, backpackContainer _player]
			];
			[_newSubContainerHandle, _subContainerCargo] call ExileClient_util_containerCargo_deserialize;
			(_serializedCargo select 3) deleteAt _forEachIndex;
		};
	}
	forEach (_serializedCargo select 3);
	{
		_weaponItems = _x;
		{
			if ((typeName _x) isEqualTo "STRING") then
			{
				_itemClassName = _x;
				if !(_itemClassName isEqualTo "") then
				{
					if ([_player, _itemClassName] call ExileClient_util_playerCargo_add) then
					{
						_weaponItems set [_forEachIndex, ""]; 
					};
				};
			}
			else
			{
				if !(_x isEqualTo []) then
				{
					_magazineClassName = _x select 0;
					_magazineBulletCount = _x select 1;
					if !(_magazineClassName isEqualTo "") then
					{
						if ([_player, _magazineClassName, _magazineBulletCount] call ExileClient_util_playerCargo_add) then
						{
							_weaponItems set [_forEachIndex, ""]; 
						};
					};
				};
			};
		}
		forEach _weaponItems;
		(_serializedCargo select 1) set [_forEachIndex, _weaponItems];
	}
	forEach (_serializedCargo select 1);
	{
		_itemClassName = _x select 0;
		_itemQuantity = _x select 1;
		_newQuantity = _itemQuantity;
		if !(_itemClassName isEqualTo "") then
		{
			if (_itemClassName in ["NVGoggles","NVGoggles_OPFOR","NVGoggles_INDEP","O_NVGoggles_hex_F","O_NVGoggles_urb_F","O_NVGoggles_ghex_F","NVGoggles_tna_F","NVGogglesB_blk_F","NVGogglesB_grn_F","NVGogglesB_gry_F"]) then
			{
				if (_player getVariable ["ExileLifeClient:Guard",false]) then
    			{
					if ([_player, _itemClassName] call ExileClient_util_playerCargo_add) then
					{
						_newQuantity = _newQuantity - 1;
					};
				};
			}
			else
			{
				if ([_player, _itemClassName] call ExileClient_util_playerCargo_add) then
				{
					_newQuantity = _newQuantity - 1;
				};
			};
		};
		(_serializedCargo select 2) set [_forEachIndex, [_itemClassName, _newQuantity]];
	}
	forEach (_serializedCargo select 2);
	_magazinesToStayInContainer = [];
	{
		_magazineClassName = _x select 0;
		_magazineBulletCount = _x select 1;
		if !(_magazineClassName isEqualTo "") then
		{
			if ([_player, _magazineClassName, _magazineBulletCount] call ExileClient_util_playerCargo_add) then
			{
			}
			else
			{
				_magazinesToStayInContainer pushBack [_magazineClassName, _magazineBulletCount];
			};
		};
	}
	forEach (_serializedCargo select 0);
	_serializedCargo set [0, _magazinesToStayInContainer];
	["takeMoneyRequest", [netId _target, 0]] call ExileClient_system_network_send;
	[_target, _serializedCargo] call ExileClient_util_containerCargo_deserialize;
};
