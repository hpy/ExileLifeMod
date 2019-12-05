/**
                    * ExilelifeClient_action_revive_aborted
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_victim","_result"];
_victim = _this;
_result = "";
try
{
    if (isNull _victim) then
    {
        throw "Where is the victim?";
    };
    if !(alive _victim) then
    {
        throw "The victim is dead already!";
    };
    _victim setVariable ['ExileLifeClientReviveState', 1, true];
    _victim setVariable ['ExileLifeClientReviveMedic',objNull];
}
catch
{
    _result = _exception;
};
_result
