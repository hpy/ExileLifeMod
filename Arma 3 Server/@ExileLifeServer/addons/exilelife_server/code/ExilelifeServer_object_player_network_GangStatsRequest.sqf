/**
                    * ExilelifeServer_object_player_network_GangStatsRequest
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

                    private["_sessionID","_playerUID","_player","_gangname","_playersgangstats","_gangvariables","_variablename","_var","_gangStats"];
_sessionID = _this select 0;
_playerUID = _this select 1;
_player = _this select 2;
_gangname = _this select 3;
_playersgangstats = [];
_gangvariables =
[
	"ExileLifeGangBoss",
	"ExileLifeGangTax",
	"ExileLifeGangWage"
];
{
	_variablename = format ["%1:%2",_x,_gangname];
	_var = missionNamespace getVariable _variablename;
	_playersgangstats pushback _var;
}forEach _gangvariables;
_gangStats = [(_playersgangstats select 0),(_playersgangstats select 1),(_playersgangstats select 2)];
_gangStats
