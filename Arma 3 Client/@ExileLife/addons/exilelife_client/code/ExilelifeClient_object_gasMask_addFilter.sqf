/**
                    * ExilelifeClient_object_gasMask_addFilter
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_itemClassname","_time"];
_itemClassname = _this select 0;
_time = round(abs((["Filters", _itemClassname, 0] call ExileLifeClient_system_setting_getValue) * 60));
if (_time > 0) then 
{
	ExileClientPlayerAttributes set [7, _time];
	["SuccessTitleAndText", ["Added filter!", format["You've have %1m %2s left.", _time / 60, _time % 60]]] call ExileClient_gui_toaster_addTemplateToast;
};