/**
                    * ExilelifeClient_gui_jobs_board_thread_update
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_endSeconds","_days","_hours","_minutes","_seconds","_text"];
disableSerialization;
_display = uiNamespace getVariable ["RscExileLifeJobsBoard",displayNull];
if !(ExileLifeJobBoard_Current isEqualTo []) then
{
	_endSeconds = parseNumber(ExileLifeJobBoard_Current select 2) - serverTime + ExileLifeTimeDifference;
	_days = floor(_endSeconds / 60 / 60 / 24);
	_hours = floor((_endSeconds / 60 / 60) % 24);
	_minutes = floor((_endSeconds / 60) % 60);
	_seconds = floor(_endSeconds % 60);
	if !((_days + _hours + _minutes + _seconds) isEqualTo 0) then
	{
		_text = format["<t>%1 days, %2 hours, %3 minutes, %4 seconds</t>",_days,_hours,_minutes,_seconds];
	}
	else
	{
		_text = "<t>0 days, 0 hours, 0 minutes, 0 seconds</t>";
	};
	(_display displayCtrl 17112) ctrlSetStructuredText parseText _text;
};
true
