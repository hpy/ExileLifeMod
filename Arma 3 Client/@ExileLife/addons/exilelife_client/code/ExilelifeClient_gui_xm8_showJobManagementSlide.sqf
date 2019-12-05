/**
                    * ExilelifeClient_gui_xm8_showJobManagementSlide
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    if (!(ExileLifeCurrentJob isEqualTo []) || !(player getVariable ['ExileLifeClientUberJobs',[]] isEqualTo [])) then
{
	['jobManagement', 0] call ExileClient_gui_xm8_slide;
}
else
{
	['You need a job first! Visit your local job board for jobs','Fine!'] call ExileClient_gui_xm8_showWarning;
};
