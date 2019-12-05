/**
                    * ExilelifeClient_system_trading_network_appBoughtRequest
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_newPlayerMoney","_appUnlocked","_response"];
_newPlayerMoney = parseNumber (_this select 0);
_appUnlocked = _this select 1;
_response = _this select 2;
missionNamespace setVariable [format ["%1%2",'ExileLifeClientXM8',_appUnlocked], _response];
player setVariable ["ExileMoney", _newPlayerMoney, true];
true
