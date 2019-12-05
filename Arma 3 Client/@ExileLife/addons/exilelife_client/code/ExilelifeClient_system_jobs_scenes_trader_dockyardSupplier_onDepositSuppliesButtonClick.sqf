/**
                    * ExilelifeClient_system_jobs_scenes_trader_dockyardSupplier_onDepositSuppliesButtonClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_complete","_step","_result"];
try
{
    _complete = 1;
	switch (ExileLifeCurrentJob select 0) do
	{
		case "prisonCollect" : {  _complete = 0; _step = 2; };
        default {_complete = 0;};
	};
    if !((ExileLifeCurrentJob select 1) isEqualTo _step) then {
        throw false;
    };
	if (_complete == 1) then
	{
        ["completeJobRequest",[]] call ExileClient_system_network_send;
		throw true;
	};
	["progressJobRequest",[]] call ExileClient_system_network_send;
}
catch
{
	_result = _exception;
};
closeDialog 0;
