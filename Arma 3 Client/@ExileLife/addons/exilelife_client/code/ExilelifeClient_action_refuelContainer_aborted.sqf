/**
                    * ExilelifeClient_action_refuelContainer_aborted
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_tempItem","_containerClassname"];
_tempItem = _this select 0;
_containerClassname = _this select 1;
if !(isNull _tempItem) then 
{
	deleteVehicle _tempItem;
};
