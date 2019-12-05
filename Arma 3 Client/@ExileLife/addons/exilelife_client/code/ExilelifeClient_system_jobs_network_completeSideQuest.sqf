/**
                    * ExilelifeClient_system_jobs_network_completeSideQuest
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_text"];
_text = _this select 0;
ExileLifeCurrentSideTask setTaskState "Succeeded";
ExileLifeJobTaskClearQueue pushBack ExileLifeCurrentSideTask;
ExileLifeCurrentSideTask = nil;
["Side Quest Completed",_text,10] spawn ExileLifeClient_gui_baguette_show;
