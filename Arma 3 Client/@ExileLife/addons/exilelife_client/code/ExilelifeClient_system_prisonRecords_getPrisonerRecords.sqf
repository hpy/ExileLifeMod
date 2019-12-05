/**
                    * ExilelifeClient_system_prisonRecords_getPrisonerRecords
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_prisonerID","_result"];
_prisonerID = _this;
_result = true;
try
{
    if (isNull player) then{
        throw false;
    };
    if (!alive player) then{
        throw false;
    };
    if (ExileLifeClientGang != "Guard") then{
		throw false;
	};
    ["getPrisonerRecordsRequest",[_prisonerID]] call ExileClient_system_network_send;
}
catch
{
    _result = _exception;
};
_result
