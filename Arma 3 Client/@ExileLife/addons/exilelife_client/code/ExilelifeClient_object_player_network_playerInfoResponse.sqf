/**
                    * ExilelifeClient_object_player_network_playerInfoResponse
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_info","_prisonerID"];
_info = _this select 0;
_prisonerID = _this select 1;
if ((_info select 0 isEqualTo "") && (_info select 1 isEqualTo "")) then
{
	ExileLifeCharacterInfoKnown = "NEW";
	ExileLifeCharacterInfo = [];
	ExileLifeCharacterInfoPrisonerID = _prisonerID;
}
else
{
	ExileLifeCharacterInfoKnown = "EXISTING";
	ExileLifeCharacterInfo = _info;
};
true
