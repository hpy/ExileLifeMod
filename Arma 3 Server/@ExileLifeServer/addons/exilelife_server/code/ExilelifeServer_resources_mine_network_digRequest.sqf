/**
                    * ExilelifeServer_resources_mine_network_digRequest
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

                    private["_sessionID","_parameters","_surfacetype","_minetype","_player","_mineeverytime","_texturetype","_isDiggingSurface","_TextureSurfaceNames","_timesmined","_maxresourcequantity","_random","_itemClassName","_quantity","_i"];
_sessionID = _this select 0;
_parameters = _this select 1;
_surfacetype = _parameters select 0;
_minetype = _parameters select 1;
_player = _sessionID call ExileServer_system_session_getPlayerObject;
_mineeverytime = false;
try
{
	if (isNull _player) then
	{
		throw "You dont exist!";
	};
	_texturetype = format ["%1_Surface",_minetype];
	_isDiggingSurface = false;
	_TextureSurfaceNames = getArray(missionConfigFile >> "CfgResources" >> "CfgResourceSurfaces" >> _texturetype >> "surface");
	{
		if !(((str _surfacetype) find _x) isEqualTo -1)exitWith {_isDiggingSurface = true};
	}
	forEach _TextureSurfaceNames;
	if !(_isDiggingSurface) then
	{
		throw "Theres nothing in the ground here...";
	};
	if !(alive _player) then
	{
		throw "Um... Your dead?";
	};
	switch (_minetype) do
	{
	    case "Salt": 		{_timesmined = ExileLifeSaltMine; _mineeverytime = true; };
	    case "Artefacts":	{_timesmined = ExileLifeArtefactsMine; };
	};
	_maxresourcequantity = getNumber(missionConfigFile >> "CfgResources" >> "CfgResourceQuantity" >> _minetype >> "quantity");
	if (_timesmined > _maxresourcequantity) then
	{
		throw "This resource has been depleted! Dig deeper...";
	};
	_random = floor random [1,1,2,3,4,5,6];
if !(_mineeverytime) then
{
	if !(_random > 2) then
	{
		throw "Theres nothing in the ground here...";
	};
};
    _timesmined = _timesmined + 1;
	switch (_minetype) do
	{
	    case "Salt": 		{ExileLifeSaltMine = _timesmined; _itemClassName = "ExileLife_Item_salt";};
	    case "Artefacts":	{ExileLifeArtefactsMine = _timesmined; _itemClassName = "ExileLife_Item_artefacts";};
	};
	_quantity = floor(random 2) + 1;
	_player = _sessionID call ExileServer_system_session_getPlayerObject;
	for "_i" from 1 to _quantity do
	{
		[_player,_itemClassName] call ExileLifeClient_util_playerCargo_addOrDrop;
	};
	[_sessionID, "toastRequest", ["SuccessTitleAndText", ["Success!", format ["You found %1 %2",_quantity,_minetype]]]] call ExileServer_system_network_send_to;
}
catch
{
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Whoops!", _exception]]] call ExileServer_system_network_send_to;
};
true
