/**
                    * ExilelifeClient_system_jobs_network_deniedJobProgression
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_jobClassname","_text","_display","_idc"];
disableSerialization;
_jobClassname = _this select 0;
_text = _this select 1;
if (isNil _text) then 
{
	_text = getText(configFile >> "CfgJobs" >> _jobClassname >> "deniedProgressionText");
};
if(_text!="") then 
{
    _text = parseText _text; 
};
_display = uiNameSpace getVariable ["RscExileLifeInformation",displayNull];
if (!isNull _display) then
{
	_idc = _display displayCtrl 16105;
	_idc ctrlSetStructuredText _text;
	_idc call BIS_fnc_ctrlTextHeight;
};
["Could Not Progress",_text,10,"red"] spawn ExileLifeClient_gui_baguette_show;
