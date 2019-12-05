/**
                    * ExilelifeClient_gui_jobs_board_onUnload
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    if !(ExileLifeJobsBoardThread isEqualTo -1) then
{
	[ExileLifeJobsBoardThread] call ExileClient_system_thread_removeTask;
};
ExileLifeJobsBoardThread = -1;
ExileLifeSelectedJobBoard = [];
ExileLifeCurrentTradersGang = "";
ExileLifeClientPrisonAllowance = -1;
ExileLifeClientGangAllowance = -1;
