/**
                    * ExilelifeClient_util_gang_countOnline
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

                    private["_gang"];
ExileLifeGangStats = [["Mafia",0],["Cartel",0],["Yakuza",0],["Syndicate",0],["Guard",0],["Rogue",0]];
{
    _gang = _x getVariable['ExileLifeClientGang',""];
    switch (_gang) do {
        case ("Mafia"): {(ExileLifeGangStats select 0) set [1,(ExileLifeGangStats select 0 select 1) + 1]};
        case ("Cartel"): {(ExileLifeGangStats select 1) set [1,(ExileLifeGangStats select 1 select 1) + 1]};
        case ("Yakuza"): {(ExileLifeGangStats select 2) set [1,(ExileLifeGangStats select 2 select 1) + 1]};
        case ("Syndicate"): {(ExileLifeGangStats select 3) set [1,(ExileLifeGangStats select 3 select 1) + 1]};
        case ("Guard"): {(ExileLifeGangStats select 4) set [1,(ExileLifeGangStats select 4 select 1) + 1]};
        default {(ExileLifeGangStats select 5) set [1,(ExileLifeGangStats select 5 select 1) + 1]}; 
    };
}forEach allPlayers;
ExileLifeGangStatsUpdateTime = time;
true
