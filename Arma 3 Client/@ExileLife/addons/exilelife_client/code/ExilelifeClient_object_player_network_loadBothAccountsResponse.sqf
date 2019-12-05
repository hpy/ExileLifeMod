/**
                    * ExilelifeClient_object_player_network_loadBothAccountsResponse
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_playerDataChar1","_playerDataChar2","_ExileLifeplayerData1","_ExileLifeplayerData2"];
_playerDataChar1 = _this select 0;
_playerDataChar2 = _this select 1;
_ExileLifeplayerData1 = _this select 2;
_ExileLifeplayerData2 = _this select 3;
ExileLifeClientCharacterSelection1 = [_playerDataChar1,_ExileLifeplayerData1];
ExileLifeClientCharacterSelection2 = [_playerDataChar2,_ExileLifeplayerData2];
ExileLifeClientPlayerAccountsLoaded = true;
