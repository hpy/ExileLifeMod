/**
                    * ExilelifeClient_util_player_skill
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

                    private["_skill","_paramRequired","_default","_playerSkills"];
_skill = param[0,""];
_paramRequired = param[1,0]; 
_default = param[2,0];
_playerSkills = player getVariable [format["ExileLifeSkill:%1",_skill],[]];
if(_playerSkills isEqualTo [])exitwith{_default};
_playerSkills select _paramRequired;
