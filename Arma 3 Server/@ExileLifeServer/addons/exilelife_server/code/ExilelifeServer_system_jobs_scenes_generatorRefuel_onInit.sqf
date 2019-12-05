/**
                    * ExilelifeServer_system_jobs_scenes_generatorRefuel_onInit
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

                    private["_sessionID","_playerObject","_jobClassname","_position","_result"];
_sessionID = _this select 0;
_playerObject = _this select 1;
_jobClassname = _this select 2;
_position = _this select 3;
_result = [];
[0,_position,2000] call ExileLifeServer_system_environment_event_lights;
ExileLifeGeneratorJobsInProgress pushBack _position;
uiNamespace setVariable ["ExileLifeGeneratorJobsInProgress",ExileLifeGeneratorJobsInProgress];
ExileLifeJobPos_generator = ExileLifeJobPos_generator - [_position];
_result
