/**
                    * ExilelifeClient_action_resting_condition
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_sleepingBag","_cancel"];
_sleepingBag = _this;
_cancel = "";
try
{
	if (isNull player) then
	{
		throw "You dont exist!";
	};
	if !(alive player) then
	{
		throw "You daided!";
	};
}
catch
{
	_cancel = _exception;
	diag_log format["_cancel: %1",_cancel];
};
_cancel