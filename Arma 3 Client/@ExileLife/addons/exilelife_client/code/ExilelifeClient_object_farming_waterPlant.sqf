/**
                    * ExilelifeClient_object_farming_waterPlant
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_completed","_garden","_greenThumbs","_gardenplot","_temparray","_plotNumber","_waterState","_index","_msg","_magazines","_removed","_override","_amount","_newamount","_result"];
_completed = false;
_garden = objectFromNetId (ExileClientInteractionObject getVariable['ExileLifeGardenID',""]);
_greenThumbs = _garden getVariable['ExileLifeFarming',[]]; 
_gardenplot = ExileClientInteractionObject getVariable['ExileLifePlotNumber',-1];
{
	_temparray = _x;
	_plotNumber = _x select 0;
	_waterState = _x select 4;
	_index = _forEachIndex;
	if (_plotNumber isEqualTo (format ["plot_%1",_gardenplot])) then
	{
		if (_waterState < 1) then
		{
			if (rain > 0.2) then
			{
				_msg = "No need to water this plant as its currently raining!";  
			}
			else
			{	
				if (_waterState == 0) then
				{
					_waterState = 1;
				};
				_waterState = _waterState * 3; 
				_magazines = magazinesAmmo player;
				_removed = false;
				_override = false;
				{
					if((_x select 0) isEqualTo "Exile_Item_WaterCanisterDirtyWater") then
					{
						_amount = (_x select 1);
						if (_amount > 0) then
						{
							if(_amount > _waterState)then
							{
								_newamount = _amount - _waterState;
								[
									player,
									["Exile_Item_WaterCanisterDirtyWater",_x select 1],
									["Exile_Item_WaterCanisterDirtyWater",_newamount]
								] call ExileClient_util_inventory_replaceMagazine;
							}
							else
							{
								[
									player,
									["Exile_Item_WaterCanisterDirtyWater",_x select 1],
									["Exile_Item_WaterCanisterEmpty",1]
								] call ExileClient_util_inventory_replaceMagazine;
							};
							_removed = true;
						};
					};
					if (_removed) exitWith {};
				}
				forEach _magazines;
				call ExileClient_object_player_save;
			};
			_temparray set [4, 1];
			_greenThumbs set [_index, _temparray];
			_garden setVariable['ExileLifeFarming',_greenThumbs,true]; 
			_msg = "You have Watered this plant!";
		}
		else
		{
			_msg = "This plant already has enough water!";
		};
		_completed = true;
	};
	if (_completed) exitWith {};
}forEach _greenThumbs;
if (_completed) then
{
	["SuccessTitleAndText", ["Farming", _msg]] call ExileClient_gui_toaster_addTemplateToast;
}
else
{
	["ErrorTitleAndText", ["Farming", "You cannot Water this Plant!"]] call ExileClient_gui_toaster_addTemplateToast;
};
_result