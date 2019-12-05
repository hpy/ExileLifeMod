/**
                    * ExilelifeClient_system_jobs_uber_thread_initialize
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    ExileLifeUberJobCheck = [2, ExilelifeClient_system_jobs_uber_thread_update, [], true,"Uber Job Check"] call ExileClient_system_thread_addtask;
"ExileLifeUberJobCheck Thread Started..." call ExileClient_util_log;
