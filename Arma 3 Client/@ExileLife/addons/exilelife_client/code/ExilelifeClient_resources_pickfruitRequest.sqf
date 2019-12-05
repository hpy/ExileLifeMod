/**
                    * ExilelifeClient_resources_pickfruitRequest
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_success","_fruitTreeModelNames","_objectClassName","_treetype","_tree","_holster"];
_success = true;
try
{
	if (isNull player) then
	{
		throw false;
	};
	if !(alive player) then
	{
		throw false;
	};
	if ((animationState player) isEqualTo "ainvpercmstpsnonwnondnon_putdown_amovpercmstpsnonwnondnon") then
	{
		throw false;
	};
	if ((animationState player) isEqualTo "amovpercmstpsnonwnondnon_ainvpercmstpsnonwnondnon_putdown") then
	{
		throw false;
	};
	_fruitTreeModelNames = getArray(missionConfigFile >> "CfgInteractionModels" >> "FruitSource" >> "models");
	_objectClassName = str(ExileClientInteractionObject);
	{
		if ((_objectClassName find _x) != -1) then
		{
			_treetype = _x; 
			_tree = ExileClientInteractionObject;
		};
	}
	forEach _fruitTreeModelNames;
	if (isNull _tree) then
	{
		throw false;
	};
	if ((player distance _tree) > 6) then
	{
		throw false;
	};
	if !(currentWeapon player isEqualTo "") then
	{
		_holster = [true] call ExileLifeClient_object_player_action_holsterweapon;
	};
	player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	if (ExileLifeClientResourceZone) then
	{
		["pickFruitRequest", [(netId _tree),_treetype]] call ExileClient_system_network_send;
	}
	else
	{
		if ((random 100) < 30) then
		{
			["pickFruitRequest", [(netId _tree),_treetype]] call ExileClient_system_network_send;
		};
	};
	ExileLifeFruitTree = [];
}
catch
{
	 _success = _exception;
};
_success
