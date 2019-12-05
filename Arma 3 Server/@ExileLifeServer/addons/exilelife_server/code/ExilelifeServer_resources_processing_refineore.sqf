/**
                    * ExilelifeServer_resources_processing_refineore
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

                    private["_emptycontainernetId","_fillcontainernetId","_emptycontainer","_emptycontainercontents","_fillcontainer","_typesofore","_foundItem","_oretype","_inventoryItemClassName","_updateinv","_itemClassname","_itemClassName","_result"];
_emptycontainernetId = _this select 0;
_fillcontainernetId = _this select 1;
try
{
	_emptycontainer = objectFromNetId _emptycontainernetId;
	if (isNull _emptycontainer) then
	{
		throw false;
	};
	_emptycontainercontents =  _emptycontainer call ExileClient_util_containerCargo_list;
	if ((count _emptycontainercontents) <= 0) then
	{
		throw false;
	};
	_fillcontainer = objectFromNetId _fillcontainernetId;
	if (isNull _fillcontainer) then
	{
		throw false;
	};
	_typesofore = getArray(missionconfigFile >> "CfgResources" >> "CfgRefineryResources" >> "oretypes");
	_foundItem = false;
	_oretype = "";
	{
    	_inventoryItemClassName = _x;
		if ((_typesofore find _inventoryItemClassName) > -1) exitWith
    	{
        	_foundItem = true;
        	_oretype = _inventoryItemClassName;
    	};
	}
	forEach _emptycontainercontents;
	if !(_foundItem) then
	{
		throw false;
	};
	_updateinv = [_emptycontainer,_oretype] call ExileClient_util_containerCargo_remove;
	if !(_updateinv) then
	{
		throw false;
	};
	_itemClassname = getText(missionconfigFile >> "CfgResources" >> "CfgRefineryResources" >> _oretype >> "refined");
	_updateinv = [_fillcontainer, _itemClassName] call ExileClient_util_containerCargo_add;
	if !(_updateinv) then
	{
		throw false;
	};
}
catch
{
	_result = _exception;
};
