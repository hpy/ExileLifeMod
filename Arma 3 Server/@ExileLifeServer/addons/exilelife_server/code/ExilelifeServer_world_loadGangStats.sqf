/**
                    * ExilelifeServer_world_loadGangStats
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

                    private["_Territories","_gangname","_gangData","_bossPID","_bossUID","_tax","_wage","_bank","_territory","_minRespect","_gangMembers","_gangMembershipCost","_gangBlacklist","_gangVault","_gangvariables","_variablename"];
_Territories = 
[
	"Mafia",
	"Syndicate",
	"Cartel",
	"Yakuza",
	"Guard",
	"Rogue"
];
{
	_gangname = _x;
	_gangData = format["loadGang:%1", _gangname] call ExileServer_system_database_query_selectSingle;
	_bossPID = _gangData select 0; 
	_bossUID = _gangData select 1;
	_tax = _gangData select 2;
	_wage = _gangData select 3;
	_bank = _gangData select 4;
	_territory = _gangData select 5;
	_minRespect = _gangData select 6;
	_gangMembers = _gangData select 7; 
	_gangMembershipCost = _gangData select 8; 
	_gangBlacklist = _gangData select 9; 
	_gangVault = _gangData select 10; 
	_gangvariables = 
	[
		["ExileLifeGangBossPID",_bossPID,false],
		["ExileLifeGangBoss",_bossUID,false],
		["ExileLifeGangTax",_tax,true], 
		["ExileLifeGangWage",_wage,false],
		["ExileLifeGangBank",_bank,false], 
		["ExileLifeGangTerritorySize",_territory,false],
		["ExileLifeGangRespect",_minRespect,true],
		["ExileLifeGangMembers",_gangMembers,false],
		["ExileLifeGangMembershipCost",_gangMembershipCost,true],
		["ExileLifeGangBlacklist",_gangBlacklist,false],
		["ExileLifeGangVault",_gangVault,false]	
	];
		{
			_variablename = format ["%1:%2",(_x select 0),_gangname];
			missionNamespace setVariable [_variablename,(_x select 1),(_x select 2)];
		}forEach _gangvariables;
} forEach _Territories;
