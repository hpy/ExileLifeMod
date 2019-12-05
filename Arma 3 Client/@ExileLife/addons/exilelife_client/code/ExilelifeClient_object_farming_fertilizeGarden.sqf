/**
                    * ExilelifeClient_object_farming_fertilizeGarden
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_garden","_gardenplot","_completed","_greenThumbs","_temparray","_plotNumber","_fertilizeState","_index","_magazines","_removed","_override","_amount","_newamount","_msg"];
_garden = _this select 0;
_gardenplot = _this select 1;
_completed = false;
_greenThumbs = _garden getVariable['ExileLifeFarming',[]]; 
if (count _greenThumbs < 1) then
{
	_greenThumbs = [["plot_0",0,0,0,0,-1,0,"",""],["plot_1",0,0,0,0,-1,0,"",""],["plot_2",0,0,0,0,-1,0,"",""],["plot_3",0,0,0,0,-1,0,"",""],["plot_4",0,0,0,0,-1,0,"",""],["plot_5",0,0,0,0,-1,0,"",""]];
};
{
	_temparray = _x;
	_plotNumber = _x select 0;
	_fertilizeState = _x select 1;
	_index = _forEachIndex;
	if (_plotNumber isEqualTo (format ["plot_%1",_gardenplot])) then
	{
		if (_fertilizeState < 1) then
		{
			if (_fertilizeState == 0) then
			{
				_fertilizeState = 1;
			};
			_fertilizeState = _fertilizeState * 1; 
			_magazines = magazinesAmmo player;
			_removed = false;
			_override = false;
			{
				if((_x select 0) isEqualTo "ExileLife_Item_Fertilizer") then
				{
					_amount = (_x select 1);
					if (_amount > 0) then
					{
						if(_amount > _fertilizeState)then
						{
							_newamount = _amount - _fertilizeState;
							[
								player,
								["ExileLife_Item_Fertilizer",_x select 1],
								["ExileLife_Item_Fertilizer",_newamount]
							] call ExileClient_util_inventory_replaceMagazine;
						}
						else
						{
							[
								player,
								["ExileLife_Item_Fertilizer",_x select 1],
								["ExileLife_Item_bucket",1]
							] call ExileClient_util_inventory_replaceMagazine;
						};
						_removed = true;
					};
				};
				if (_removed) exitWith {};
			}
			forEach _magazines;
			call ExileClient_object_player_save;
			_temparray set [1, 1];
			_greenThumbs set [_index, _temparray];
			_garden setVariable['ExileLifeFarming',_greenThumbs,true]; 
			_msg =  "You have Fertilized this garden plot!";
			_garden setObjectTextureGlobal [_gardenplot, "\exilelife_assets\models\Items\Farming\Images\plot_fertilised_co.paa"];
			_completed = true;
		}
		else
		{
			_msg = "This Garden Plot has already been Fertilized!";
		};
		_completed = true;
	};
	if (_completed) exitWith {};
}forEach _greenThumbs;
if (_completed) then
{
	["SuccessTitleAndText", ["Farming",_msg]] call ExileClient_gui_toaster_addTemplateToast;
}
else
{
	["ErrorTitleAndText", ["Farming", _msg]] call ExileClient_gui_toaster_addTemplateToast;
};
_completed