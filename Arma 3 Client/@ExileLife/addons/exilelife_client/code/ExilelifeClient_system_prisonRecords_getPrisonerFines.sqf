/**
                    * ExilelifeClient_system_prisonRecords_getPrisonerFines
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_result"];
_result = true;
try
{
    if (isNull player) then{
        throw false;
    };
    if (!alive player) then{
        throw false;
    };
    if (ExileLifeClientGang == "Guard") then{
		throw false;
	};
    ["getPrisonerFinesRequest",[]] call ExileClient_system_network_send;
}
catch
{
    _result = _exception;
};
_result
