/**
                    * ExilelifeServer_resources_harvest_network_pickFruitRequest
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

                    private["_sessionId","_parameters","_treeNetId","_treetype","_player","_sessionID","_tree","_isTree","_treeModelNames","_fruitTypes","_timespicked","_maxresourcequantity","_amount","_itemClassName","_i"];
_sessionId = _this select 0;
_parameters = _this select 1;
_treeNetId = _parameters select 0;
_treetype = _parameters select 1;
_player = _sessionID call ExileServer_system_session_getPlayerObject;
try
{
	if (isNull _player) then
	{
		throw "You dont exist!";
	};
	_tree = objectFromNetId _treeNetId;
	_isTree = false;
	_treeModelNames = getArray(missionConfigFile >> "CfgInteractionModels" >> "FruitSource" >> "models");
	{
		if !(((str _tree) find _x) isEqualTo -1)exitWith {_isTree = true};
	}
	forEach _treeModelNames;
	if !(_isTree) then
	{
		throw "The Tree doesnt exist!";
	};
	if !(alive _player) then
	{
		throw "Um... Your dead?";
	};
	if !(alive _tree) then
	{
		throw "The tree is destroyed... hmmmm"
	};
	_fruitTypes = getArray(missionConfigFile >> "CfgResources" >> "CfgPlantResources" >> "planttypes");
	{
		if(_treetype==_x select 0) then
		{
			_treetype = _x select 1;
			switch (_treetype) do
			{
			    case "Oranges": {_timespicked = ExileLifeOrangeTree; };
			    case "Apples": { _timespicked = ExileLifeAppleTree; };
			};
		};
	}forEach _fruitTypes;
	_maxresourcequantity = getNumber(missionConfigFile >> "CfgResources" >> "CfgResourceQuantity" >> _treetype >> "quantity");
	if (_timespicked > _maxresourcequantity) then
	{
		throw "There is no more fruit on this tree!";
	};
	_amount = floor random [1,1,3];
    _timespicked = _timespicked + _amount;
	switch (_treetype) do
	{
	    case "Oranges": 
	    {
			if(_amount==1) then 
			{
				_treetype = "Orange";
			}; 
			ExileLifeOrangeTree = _timespicked; 
			_itemClassName = "ExileLife_Item_orange";
		};
	    case "Apples":	
	    {
			if(_amount==1) then 
			{
				_treetype = "Apple";
			}; 
			ExileLifeAppleTree = _timespicked; 
			_itemClassName = "ExileLife_Item_apple";
		};
	};
	for "_i" from 1 to _amount do
	{
		[_player, _itemClassName] call ExileLifeClient_util_playerCargo_addOrDrop;
	};
	[_sessionID, "toastRequest", ["SuccessTitleAndText", ["Success!", format["You found %1 %2",_amount,_treetype]]]] call ExileServer_system_network_send_to;
}
catch
{
	[_sessionID, "toastRequest", ["ErrorTitleAndText", ["Whoops!", _exception]]] call ExileServer_system_network_send_to;
};
true
