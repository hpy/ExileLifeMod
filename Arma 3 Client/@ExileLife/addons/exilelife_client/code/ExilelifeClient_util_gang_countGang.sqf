/**
                    * ExilelifeClient_util_gang_countGang
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

                    private["_gang","_count"];
_gang = _this;
_count = 0;
if ((isNil "ExileLifeGangStatsUpdateTime")||(time >= (ExileLifeGangStatsUpdateTime + 120))) then {
    call ExileLifeClient_util_gang_countOnline;
};
switch (_gang) do {
    case ("Mafia"): {_count = (ExileLifeGangStats select 0 select 1);};
    case ("Cartel"): {_count = (ExileLifeGangStats select 1 select 1);};
    case ("Yakuza"): {_count = (ExileLifeGangStats select 2 select 1);};
    case ("Syndicate"): {_count = (ExileLifeGangStats select 3 select 1);};
    case ("Guard"): {_count = (ExileLifeGangStats select 4 select 1);};
    default {_count = (ExileLifeGangStats select 5 select 1);}; 
};
_count
