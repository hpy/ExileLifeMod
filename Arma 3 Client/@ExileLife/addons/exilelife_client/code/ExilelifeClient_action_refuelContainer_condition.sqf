/**
                    * ExilelifeClient_action_refuelContainer_condition
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_tempItem","_containerClassname","_cancel"];
_tempItem = _this select 0;
_containerClassname = _this select 1;
_cancel = "";
try
{
	if (isNull player)then
	{
		throw "ARMAgedon";
	};
	if !(alive player)then
	{
		throw "Y U HAVE TO BE DEAD";
	};
	if !([player, _containerClassname] call ExileLifeClient_util_playerCargo_contains) then
	{
		throw "Where did your container go?";
	};
}
catch
{
	_cancel = _exception;
};
_cancel
