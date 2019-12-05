/**
                    * ExilelifeServer_object_player_database_update
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

                    private["_player","_playerID","_data","_extDB2Message"];
_player = _this select 0;
_playerID = _player getVariable ["ExileLifePID", -1];
_data =
[
	_player getVariable ["ExileName",""],
	_player getVariable ["ExileLifeClientSpawnChoice",""],
  	_player getVariable ['ExileLifeClientClass', ""],
  	_player getVariable ["ExileLifeClientRank", 0],
  	_player getVariable ['ExileLifeClientGang', ""],
	((_player getVariable ["ExileLifeSkill:Lockpick", [0, 0]]) select 0),
	((_player getVariable ["ExileLifeSkill:Lockpick", [0, 0]]) select 1),
	((_player getVariable ["ExileLifeSkill:Strength", [0, 0]]) select 0),
	((_player getVariable ["ExileLifeSkill:Strength", [0, 0]]) select 1),
	((_player getVariable ["ExileLifeSkill:Speed", [0, 0]]) select 0),
	((_player getVariable ["ExileLifeSkill:Speed", [0, 0]]) select 1),
	((_player getVariable ["ExileLifeSkill:Heal", [0, 0]]) select 0),
	((_player getVariable ["ExileLifeSkill:Heal", [0, 0]]) select 1),
	((_player getVariable ["ExileLifeSkill:Repair", [0, 0]]) select 0),
	((_player getVariable ["ExileLifeSkill:Repair", [0, 0]]) select 1),
	_player getVariable ["ExileLifeGasMaskTimeLeft", 0],
	_playerID
];
_extDB2Message = ["updatePlayerExileLife", _data] call ExileServer_util_extDB2_createMessage;
_extDB2Message call ExileServer_system_database_query_fireAndForget;
true
