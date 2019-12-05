/**
                    * ExilelifeClient_system_jobs_scenes_prisonCollect_onCollectOreRequest
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_response"];
_response = true;
try
{
	if (isNull player) then
	{
		throw false;
	};
	if !(alive player) then
	{
		throw false;
	};
	if (player getVariable ["ExileLifePrisoner",false]) then
	{
		throw false;
	};
	if !(ExileLifeGuard) then
	{
		throw false;
	};
    if (ExileLifeCurrentJob isEqualto []) then
    {
        ["ErrorTitleAndText", "The ore is not ready for collection. See the Guard Job Board"] call ExileClient_gui_toaster_addTemplateToast;
        throw false;
    };
    if !(ExileLifeCurrentJob select 0 == "prisonCollect") then
    {
        ["ErrorTitleAndText", "The ore is not ready for collection. See the Guard Job Board"] call ExileClient_gui_toaster_addTemplateToast;
        throw false;
    };
    if !((ExileLifeCurrentJob select 1) isEqualTo 1) then
    {
        throw false;
    };
	["InfoTitleOnly",["Please wait while the ore is transferred..."]] call ExileClient_gui_toaster_addTemplateToast;
    ["collectPrisonOre", (player getVariable ["ExileLifeJobVehicle",""])] spawn ExileClient_action_execute;
}
catch
{
	_response = _exception;
};
_response
