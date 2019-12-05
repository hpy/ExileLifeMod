/**
                    * ExilelifeServer_system_jobs_scenes_generatorAthira_onForfeit
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

                    private["_sessionID","_playerObject","_result","_jobInfo","_position"];
_sessionID = _this select 0;
_playerObject = _this select 1;
_result = "";
_jobInfo = _playerObject getVariable ["ExileLifeJobs:Current",[]];
_position = _jobInfo select 3;
ExileLifeGeneratorJobsInProgress = ExileLifeGeneratorJobsInProgress - [_position];
uiNamespace setVariable ["ExileLifeGeneratorJobsInProgress",ExileLifeGeneratorJobsInProgress];
_result