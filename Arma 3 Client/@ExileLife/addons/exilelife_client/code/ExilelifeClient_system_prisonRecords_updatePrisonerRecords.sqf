/**
                    * ExilelifeClient_system_prisonRecords_updatePrisonerRecords
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
    if (ExileLifeClientGang != "Guard") then{
		throw false;
	};
    ["updatePrisonerRecordsRequest",[ExileLifeCriminalRecordID select 0,ExileLifeInfraction,ExileLifeOldInfraction,ExileLifeCriminalRecord select 2,ExileLifeCriminalRecord select 3]] call ExileClient_system_network_send;
    ExileLifeCriminalRecordsAdd = false; 
    ExileLifeInfraction = nil;
    ExileLifeOldInfraction = nil;
    ExileLifeCriminalRecord = [];
    ExileLifeCriminalRecordsList = [];
}
catch
{
    _result = _exception;
};
_result
