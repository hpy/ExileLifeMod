/**
                    * ExilelifeServer_system_environment_thread_initialize
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

                    ExileLifeSoundArray = [];
"SoundChk thread started" call ExileServer_util_log;
ExileLifeSoundThread = [0.5, ExileLifeServer_system_environment_soundChk, [], true,"Sound Check"] call ExileServer_system_thread_addTask;
ExileLifeLightArray = [];
"LightChk thread started" call ExileServer_util_log;
ExileLifeLightThread = [1, ExileLifeServer_system_environment_lightChk, [], true,"Light Check"] call ExileServer_system_thread_addTask;
ExileLifeEffectArray = [];
"EffectChk thread started" call ExileServer_util_log;
ExileLifeEffectThread = [1, ExileLifeServer_system_environment_effectChk, [], true,"Effect Check"] call ExileServer_system_thread_addTask;
true
