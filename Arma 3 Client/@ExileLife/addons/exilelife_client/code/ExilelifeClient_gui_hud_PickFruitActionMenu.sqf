/**
                    * ExilelifeClient_gui_hud_PickFruitActionMenu
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_nearestobjects","_fruitTreeModelNames","_object","_objectClassName","_positionobject"];
_nearestobjects = nearestObjects [player, [], 10];
_fruitTreeModelNames = getArray(missionConfigFile >> "CfgInteractionModels" >> "FruitSource" >> "models");
{
	_object = _x;
	_objectClassName = str(_object);
	{
		if ((_objectClassName find _x) != -1) then
		{ 
			_positionobject = getposatl _object;
			[_x,_positionobject,_object] call ExileLifeClient_gui_hud_PickFruitActionMenuDraw;
		};
	}
	forEach _fruitTreeModelNames;
}
forEach _nearestobjects;
