/**
                    * ExilelifeServer_system_jobs_scenes_fishingSmall_onProgression_step1
                    *
                    * Exile Mod
                    * www.exilemod.com
                    * © 2016 Exile Mod Team
                    *
                    * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
                    * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
                    * 
                    * Permission granted to ExileLife Dev Team to overwrite files and redistribute them
                    *
                    */

                    private["_sessionID","_jobClassname","_nextStep","_result","_msg"];
_sessionID = _this select 0;
_jobClassname = _this select 1;
_nextStep = _this select 2;
_result = "";
_msg = "I heard someone say that dropping dog food in the water makes great berley...";
[_sessionID,"addSideQuest",[_jobClassname,_nextStep,[],_msg,1,""]] call ExileServer_system_network_send_to;
_result
