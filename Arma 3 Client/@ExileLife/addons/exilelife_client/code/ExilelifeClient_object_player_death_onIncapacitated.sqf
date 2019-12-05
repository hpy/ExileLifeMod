/**
                    * ExilelifeClient_object_player_death_onIncapacitated
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_victim","_killer","_instigator","_netidVictim","_netidKiller","_netidInstigator"];
_victim = param[0,player];
_killer = param[1,objNull];
_instigator = param[2,objNull];
_netidVictim = netid _victim;
_netidKiller = netid _killer;
_netidInstigator = netid _instigator;
["onIncapacitatedRequest",[_netidVictim,_netidKiller,_netidInstigator]] call ExileClient_system_network_send;
[_netidVictim] call ExileLifeClient_object_player_death_network_onIncapacitatedResponse;
true
