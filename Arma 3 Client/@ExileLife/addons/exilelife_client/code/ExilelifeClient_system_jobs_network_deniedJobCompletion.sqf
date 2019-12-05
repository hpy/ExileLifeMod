/**
                    * ExilelifeClient_system_jobs_network_deniedJobCompletion
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_jobClassname","_display","_text","_idc"];
disableSerialization;
_jobClassname = _this select 0;
_display = uiNameSpace getVariable ["RscExileLifeInformation",displayNull];
_text = getText(configFile >> "CfgJobs" >> _jobClassname >> "deniedCompletionText");
if(_text!="") then 
{
    _text = parseText _text; 
};
if (!isNull _display) then
{
	_idc = _display displayCtrl 16105;
	_idc ctrlSetStructuredText _text;
	_idc call BIS_fnc_ctrlTextHeight;
};
["Job Not Complete",_text,10,"red"] spawn ExileLifeClient_gui_baguette_show;
