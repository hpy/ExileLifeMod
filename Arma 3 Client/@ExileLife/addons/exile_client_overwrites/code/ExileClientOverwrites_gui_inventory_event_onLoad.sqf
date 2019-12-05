/**
                    * ExileClientOverwrites_gui_inventory_event_onLoad
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

                    private["_display","_playerTopBar","_containerTopBar","_groundTab","_soldierTab","_groundContainer","_soldierContainer","_playerName","_NVGContainer","_armBandContainer","_gangicon","_gangArmband","_color","_ItemListBox","_bypassDetected","_safes","_vehicles"];
disableSerialization;
_display = _this select 0;
_playerTopBar = _display displayCtrl 1020;
_containerTopBar = _display displayCtrl 1021;
_groundTab = _display displayCtrl 6321;
_soldierTab = _display displayCtrl 6401;
_groundContainer = _display displayCtrl 632;
_soldierContainer = _display displayCtrl 640;
_playerName = _display displayCtrl 111;
_NVGContainer = _display displayCtrl 6217;
_armBandContainer = _display displayCtrl 6317;
ExileLifeLayerWatermark cutText ["", "PLAIN"];
_playerName ctrlSetText ([player] call ExileLifeClient_util_player_name);
if !(player getVariable ["ExileLifeClient:Guard",false]) then
{
	_NVGContainer ctrlSetPosition [0,0,0];
	_NVGContainer ctrlEnable false;
	_NVGContainer ctrlShow false;
	if ((isNil 'ExileLifeClientGang') || ExileLifeClientGang isEqualTo "" || ExileLifeClientGang isEqualTo "Rogue") then
	{
		_gangicon = "\exilelife_assets\texture\ui\Inventory\Bambi_Icon_ca.paa";
	}
	else
	{
		_gangicon = format ["\exilelife_assets\texture\ui\Inventory\%1_icon_ca.paa",ExileLifeClientGang];
		_gangArmband = format ["ExileLife_Clothing_%1_Armband",ExileLifeClientGang];
		if !((hmd player) isEqualTo _gangArmband) then
		{
			player unlinkItem hmd player;
			player linkItem _gangArmband;
		};
		_armBandContainer ctrlEnable false;
		switch (ExileLifeClientGang) do
		{
			case "Cartel":
			{
				_color = [0.129,0.306,0.129,1];
			};
			case "Mafia":
			{
				_color = [0.322,0.212,0.322,1];
			};
			case "Syndicate":
			{
				_color = [0.247,0.11,0.043,1];
			};
			case "Yakuza":
			{
				_color = [0.161,0.031,0.043,1];
			};
			default
			{
				_color = [0.1,0.1,0.1,1];
			};
		};
		_playerTopBar ctrlSetBackGroundColor _color;
		_containerTopBar ctrlSetBackGroundColor _color;
	};
	_armBandContainer ctrlSetText _gangicon;
}
else
{
	_armBandContainer ctrlEnable false;
	_armBandContainer ctrlShow false;
	_playerTopBar ctrlSetBackGroundColor [0.063,0.11,0.161,1];
	_containerTopBar ctrlSetBackGroundColor [0.063,0.11,0.161,1];
};
_ItemListBox = _display displayCtrl 8920;
_ItemListBox ctrlEnable false;
_ItemListBox ctrlShow false;
_bypassDetected = false;
if (ctrlShown _soldierTab) then
{
	if ((ExileClientCurrentInventoryContainer isKindOf "GroundWeaponHolder") || (ExileClientCurrentInventoryContainer isKindOf "WeaponHolderSimulated") || (ExileClientCurrentInventoryContainer isKindOf "Man")) then
	{
		_safes = player nearObjects ["Exile_Container_Safe", 3];
		{
			if (_x getVariable ["ExileIsLocked", 1] isEqualTo -1) exitWith
			{
				_bypassDetected = true;
			};
		}
		forEach _safes;
		if !(_bypassDetected) then
		{
			_vehicles = player nearObjects ["AllVehicles", 5];
			{
				if ((locked _x) isEqualTo 2) exitWith
				{
					if !(local _x) then
					{
						_bypassDetected = true;
					};
				};
			}
			forEach _vehicles;
		};
	};
	if (_bypassDetected) then
	{
		_soldierTab ctrlSetPosition [-1, -1];
		_soldierTab ctrlShow false;
		_soldierTab ctrlCommit 0;
		_soldierContainer ctrlSetPosition [-1, -1];
		_soldierContainer ctrlShow false;
		_soldierContainer ctrlCommit 0;
		ctrlSetFocus _groundTab;
		ctrlActivate _groundTab;
	};
};
call ExileClient_gui_inventory_updatePopTabControls;
