/**
                    * ExilelifeClient_system_allowance_thread_initialize
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_time"];
_time = (getNumber(missionConfigFile >> "CfgAllowance" >> "gangallowancetime") * 60);
ExileLifeGangPayCheck = [_time, ExileLifeClient_system_allowance_gangAllowance, [], true,"Gang Allowance"] call ExileClient_system_thread_addtask;
"ExileLifeGangPayCheck Thread Started..." call ExileClient_util_log;
_time = (getNumber(missionConfigFile >> "CfgAllowance" >> "prisonallowancetime") * 60);
ExileLifePrisonerPayCheck = [_time, ExileLifeClient_system_allowance_prisonAllowance, [], true,"Prisoner Allowance"] call ExileClient_system_thread_addtask;
"ExileLifePrisonerPayCheck Thread Started..." call ExileClient_util_log;