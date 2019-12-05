/**
                    * ExilelifeClient_gui_escape_disconnect
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_jobClassname","_cancelOnDisconnect","_failOnDisconnect","_msg","_result","_display"];
disableSerialization;
if !(ExileLifeCurrentJob isEqualTo []) then
{
    _jobClassname = ExileLifeCurrentJob select 0;
    _cancelOnDisconnect = getNumber(configFile >> "CfgJobs" >> _jobClassname >> "cancelOnDisconnect");
    _failOnDisconnect = getNumber(configFile >> "CfgJobs" >> _jobClassname >> "failOnDisconnect");
    _msg = "";
    if(_cancelOnDisconnect != 0)then{
        _msg = "Disconnecting will fail your current job and you will be executed for desertion!";
    }else{
        if(_failOnDisconnect != 0)then{
            _msg = "Disconnecting will fail your current job!";
        };
    };
    if(_msg isEqualTo "")then{
        _result = true;
    }else{
        _result = [_msg, "Confirm", "Yes", "Nah"] call BIS_fnc_guiMessage;
    };
    waitUntil { !isNil "_result" };
    if (_result) then
    {
    	_display = findDisplay 49;
    	if !(isNull _display) then
    	{
    		_display closeDisplay 2; 
    	};
        endmission 'B'; 
    };
}else{
    endmission 'B'; 
};
true
