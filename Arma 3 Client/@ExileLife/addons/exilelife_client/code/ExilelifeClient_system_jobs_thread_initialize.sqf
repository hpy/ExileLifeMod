/**
                    * ExilelifeClient_system_jobs_thread_initialize
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    ExileLifeCurrentJobCheck = [60, ExileLifeClient_system_jobs_thread_chk, [], true,"Job Check"] call ExileClient_system_thread_addtask;
"ExileLifeCurrentJobCheck Thread Started..." call ExileClient_util_log;
