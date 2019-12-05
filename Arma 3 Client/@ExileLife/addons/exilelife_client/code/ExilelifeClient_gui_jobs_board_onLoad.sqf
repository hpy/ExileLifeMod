/**
                    * ExilelifeClient_gui_jobs_board_onLoad
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    ExileLifeJobsBoardThread = -1;
ExileLifeJobBoard_Current = [];
ExileLifeSelectedJobBoard = [];
ExileLifeCurrentTradersGang = "";
ExileLifeClientPrisonAllowance = -1;
ExileLifeClientGangAllowance = -1;
ExileLifeJobsBoardThread = [1,ExileLifeClient_gui_jobs_board_thread_update,[],true,"Job Board"] call ExileClient_system_thread_addTask;
call ExileLifeClient_gui_jobs_board_thread_update;
call ExileLifeClient_gui_jobs_board_event_updateAvailableJobs;
