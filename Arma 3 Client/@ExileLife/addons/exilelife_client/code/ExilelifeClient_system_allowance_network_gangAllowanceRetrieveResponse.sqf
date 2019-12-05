/**
                    * ExilelifeClient_system_allowance_network_gangAllowanceRetrieveResponse
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_amount","_success"];
_amount = _this select 0;
_success = _this select 1;
ExileLifeClientAllowanceRequest = false;
if (_success) then 
{
	ExileLifeClientGangAllowance = _amount;
}
else
{
	ExileLifeClientGangAllowance = -1;
};
