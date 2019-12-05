/**
                    * ExilelifeClient_action_doPoo_condition
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_pooPot","_result"];
_pooPot = _this;
_result = "";
try
{ 
	if (isNull player) then 
	{
		throw "You dont exist...";
	};
	if !(alive player) then 
	{
		throw "You died with your pants down!";
	};
	if (isNull _pooPot) then 
	{
		throw "What happened to your Poo Pot?";
	};
	if !(ExileLifeSittingDown) then 
	{
		throw "You cant rush doing a poo!";
	};
	if (ExileLifeDoPooTimer > time) then 
	{
		throw "I dont need to poo yet!";
	};
}
catch
{
	_result = _exception;
};
_result
